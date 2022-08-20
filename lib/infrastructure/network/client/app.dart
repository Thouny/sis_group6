import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:sis_group6/infrastructure/network/client/network.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/connection_service.dart';
import 'package:sis_group6/infrastructure/network/endpoint/base/endpoint.dart';

class AppClient implements NetworkClient {
  AppClient(Client client, ConnectionService connection)
      : _httpClient = client,
        _connection = connection;

  final Client _httpClient;
  final ConnectionService _connection;

  @override
  Future<J> send<J, E extends Endpoint<J>>(E endpoint) async {
    if (await _connection.isConnected) {
      final request = endpoint.request;
      if (request != null) {
        final response = await Response.fromStream(
          await _httpClient.send(request),
        );

        final result = endpoint.decode(response.httpResponse);
        return result;
      } else {
        throw Exception('Incorrect Request');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }

  @override
  void cancel() {
    _httpClient.close();
  }
}

class ConnectivityService extends ConnectionService {
  @override
  Future<bool> get isConnected async {
    final status = await _connectivity.checkConnectivity();
    switch (status) {
      case ConnectivityResult.none:
        return false;
      default:
        return true;
    }
  }

  /// Creates a [ConnectivityService] object.
  ///
  /// While [Connectivity] provides a [Stream] to listen to connection
  /// status changes, this is unreliable on Android SDK >= 26, so connectivity
  /// status must be checked every time via [ConnectionService.isConnected].
  ConnectivityService(
    Connectivity connectivity, {
    bool debugEnabled = false,
  })  : _connectivity = connectivity,
        super(debugEnabled: debugEnabled);

  final Connectivity _connectivity;
}

extension DefaultRequest on Endpoint {
  BaseRequest? get request {
    if (host.isNotEmpty) {
      final preparedRequest = Request(
        method.name,
        Uri(scheme: scheme.name, host: host, path: path, query: encodeQueries),
      );

      // Configure Headers
      final updatedHeader = Map<String, String>.from(header);
      updatedHeader['Content-Type'] = contentType.value;
      if (updatedHeader.isNotEmpty) {
        preparedRequest.headers.addAll(updatedHeader);
      }
      // Configure Body
      if (method.isNeedBody) {
        preparedRequest.body = jsonEncode(body);
      }
      return preparedRequest;
    } else {
      return null;
    }
  }
}

extension HTTPResponse on Response {
  HttpResponse get httpResponse {
    return HttpResponse(
      statusCode: statusCode,
      data: jsonDecode(body) as Map<String, dynamic>,
    );
  }
}
