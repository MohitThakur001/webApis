// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';


import '../routes/occuption_type.dart' as occuption_type;
import '../routes/index.dart' as index;
import '../routes/home.dart' as home;
import '../routes/api/index.dart' as api_index;
import '../routes/api/example.dart' as api_example;

import '../routes/_middleware.dart' as middleware;

void main() => createServer();

Future<HttpServer> createServer() async {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final handler = Cascade().add(createStaticFileHandler()).add(buildRootHandler()).handler;
  final server = await serve(handler, address, port);
  print('\x1B[92m✓\x1B[0m Running on http://${server.address.host}:${server.port}');
  return server;
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/api', (context) => buildApiHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildApiHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => api_index.onRequest(context,))..all('/example', (context) => api_example.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/occuption_type', (context) => occuption_type.onRequest(context,))..all('/', (context) => index.onRequest(context,))..all('/home', (context) => home.onRequest(context,));
  return pipeline.addHandler(router);
}
