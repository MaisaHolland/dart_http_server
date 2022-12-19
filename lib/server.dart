import 'dart:io';
import 'package:dart_http_server/middlewares/json_content_type.dart';
import 'package:dart_http_server/routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf;

Future<HttpServer> server({
  String host = '127.0.0.1',
  int port = 8080,
}) async {
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addJsonContentType()
      .addHandler(routes());

  return shelf.serve(handler, host, port)
    ..then((server) {
      print('Serving at http://${server.address.host}:${server.port}');
    });
}
