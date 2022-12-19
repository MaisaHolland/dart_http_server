import 'dart:convert';

import 'package:dart_http_server/handlers/fixtures/body_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

extension Testing on Router {
  void testingRoutes() {
    get('/routeTesting', routeTesting);
  }

  Future<Response> routeTesting(Request request) async {
    await Future.delayed(Duration(seconds: 2));
    return Response.ok(jsonEncode(
      BodyResponse.routeTestingResponse,
    ));
  }
}
