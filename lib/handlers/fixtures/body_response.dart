import 'dart:io';

class BodyResponse {
  static const _baseDirectory = 'lib/handlers/fixtures/';

  static String get routeTestingResponse =>
      File('$_baseDirectory/route_testing_response.dart').readAsStringSync();
}
