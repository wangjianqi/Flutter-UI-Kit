
import 'dart:async';

import 'package:flutter_uikit/model/login.dart';
import 'package:flutter_uikit/model/otp.dart';
import 'package:flutter_uikit/services/abstract/i_otp_service.dart';
import 'package:flutter_uikit/services/network_service_response.dart';
import 'package:flutter_uikit/utils/uidata.dart';

///实现方法 继承抽象类
class MockOTPService implements IOTPService {
  @override
  Future<NetworkServiceResponse<CreateOTPResponse>> createOTP(
      String phoneNumber) async {
    ///延迟
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
      success: true,
      content: null,
    ));
  }

  @override
  Future<NetworkServiceResponse<OTPResponse>> fetchOTPLoginResponse(
      Login userLogin) async {
    await Future.delayed(Duration(seconds: 2));
    ///返回Future的值
    return Future.value(NetworkServiceResponse(
        success: true,
        content: kOTPResponse,
        message: UIData.something_went_wrong));
  }
}

///登录数据
var kOTPResponse = new OTPResponse(
    data: const OTPData(authToken: "abcd", userId: "1245"), status: "success");
