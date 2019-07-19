import 'package:flutter_uikit/services/restclient.dart';

///网络请求
abstract class NetworkService {
  RestClient rest;
  NetworkService(this.rest);
}
