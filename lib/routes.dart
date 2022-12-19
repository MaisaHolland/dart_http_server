import 'package:dart_http_server/handlers/testing.dart';
import 'package:shelf_router/shelf_router.dart';

Router routes() => Router()
  ..testingRoutes();
  //adding one or more calls to the handler's routes() method
  //..testingRoutes();
