import 'dart:async';
import 'dart:io';
import 'package:dart_http_server/server.dart';
import 'package:hotreloader/hotreloader.dart';


void main() => _runWithHotReload(server);

void _runWithHotReload(FutureOr<HttpServer> Function() initializer) async {
  HttpServer? runningServer;

  obtainNewServer(FutureOr<HttpServer> Function() initializer) async {
    var willReplaceServer = runningServer != null;
    await runningServer?.close(force: true);
    if (willReplaceServer) {
      print('___\n[shelf_hotreload] Application reloaded.');
    }
    runningServer = await initializer();
  }

  try {
    await HotReloader.create(onAfterReload: (ctx) {
      obtainNewServer(initializer);
    });
    print('[shelf_hotreload] Hot reload is enabled.');
  } on StateError catch (e) {
    if (e.message.contains('VM service not available')) {
      print(
          '[shelf_hotreload] Hot reload not enabled. Run this app with --enable-vm-service (or use debug run) in order to enable hot reload.');
    } else {
      rethrow;
    }
  }

  await obtainNewServer(initializer);
}