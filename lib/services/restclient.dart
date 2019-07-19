import 'dart:async';
import 'dart:convert';
import 'package:flutter_uikit/services/network_service_response.dart';
import 'package:http/http.dart' as http;

class RestClient {
  ///header
  Map<String, String> headers = {
    "CONTENT_TYPE": 'application/json',
    "ACCEPT": 'application/json',
  };

  ///get方法
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(
      String resourcePath) async {
    var response = await http.get(resourcePath);
    return processResponse<T>(response);
  }

  ///post方法
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data) async {
    ///参数
    var content = json.encoder.convert(data);
    var response =
        await http.post(resourcePath, body: content, headers: headers);
    return processResponse<T>(response);
  }

  ///处理响应数据
  MappedNetworkServiceResponse<T> processResponse<T>(http.Response response) {
    if (!((response.statusCode < 200) ||
        (response.statusCode >= 300) ||
        (response.body == null))) {
      ///body数据
      var jsonResult = response.body;
      dynamic resultClass = jsonDecode(jsonResult);

      ///返回数据成功
      return new MappedNetworkServiceResponse<T>(
          mappedResult: resultClass,
          networkServiceResponse: new NetworkServiceResponse<T>(success: true));
    } else {
      ///错误响应
      var errorResponse = response.body;
      ///返回数据错误
      return new MappedNetworkServiceResponse<T>(
          networkServiceResponse: new NetworkServiceResponse<T>(
              success: false,
              message: "(${response.statusCode}) ${errorResponse.toString()}"));
    }
  }
}
