class NetworkServiceResponse<T> {
  ///泛型
  T content;
  bool success;
  String message;

  NetworkServiceResponse({this.content, this.success, this.message});
}

class MappedNetworkServiceResponse<T> {
  dynamic mappedResult;
  NetworkServiceResponse<T> networkServiceResponse;
  MappedNetworkServiceResponse(
      {this.mappedResult, this.networkServiceResponse});
}
