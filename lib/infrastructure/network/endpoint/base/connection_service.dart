abstract class ConnectionService {
  const ConnectionService({this.debugEnabled = false});

  Future<bool> get isConnected;

  final bool debugEnabled;
}
