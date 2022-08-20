import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';

abstract class NetworkClient {
  Future<J> send<J, E extends Endpoint<J>>(E endpoint);

  void cancel();
}
