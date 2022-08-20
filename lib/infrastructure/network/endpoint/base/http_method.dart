part of 'endpoint.dart';

enum HttpMethod { post, get, put, patch, delete }

extension HttpMethodExtension on HttpMethod {
  bool get isNeedBody {
    switch (this) {
      case HttpMethod.post:
        return true;
      case HttpMethod.put:
        return true;
      case HttpMethod.patch:
        return true;
      default:
        return false;
    }
  }
}
