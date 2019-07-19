import 'package:flutter/material.dart';

class CreateOTPResponse {
  String status;
  CreateOTPResponse({this.status});

  CreateOTPResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'];
}

class OTPResponse {
  ///状态
  String status;
  ///model数据
  OTPData data;
  OTPResponse({this.status, this.data});

  OTPResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        data = OTPData.fromJson(json['data']);
}

///
class OTPData {
  final String authToken;
  final String userId;
  const OTPData({@required this.authToken, @required this.userId});

  OTPData.fromJson(Map<String, dynamic> json)
      : authToken = json['authToken'],
        userId = json['userId'];
}
