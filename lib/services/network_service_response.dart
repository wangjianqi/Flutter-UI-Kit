

///网络返回
class NetworkServiceResponse<T> {
  ///泛型
  T content;
  bool success;
  String message;

  NetworkServiceResponse({this.content, this.success, this.message});
}

///map
class MappedNetworkServiceResponse<T> {
  ///动态类型：api返回的数据
  dynamic mappedResult;
  NetworkServiceResponse<T> networkServiceResponse;
  MappedNetworkServiceResponse(
      {this.mappedResult, this.networkServiceResponse});
}
