import 'package:flutter_uikit/services/network_service_response.dart';

///Api类型
enum ApiType { performOTP, performLogin, getProductInfo }

///
class FetchProcess<T> {
  ///Api
  ApiType type;
  bool loading;
  NetworkServiceResponse<T> response;

  FetchProcess({this.loading, this.response, this.type});
}
