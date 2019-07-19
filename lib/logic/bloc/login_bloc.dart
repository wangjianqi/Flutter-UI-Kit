import 'dart:async';
import 'package:flutter_uikit/logic/viewmodel/user_login_view_model.dart';
import 'package:flutter_uikit/model/fetch_process.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final otpController = StreamController<UserLoginViewModel>();
  final loginController = StreamController<UserLoginViewModel>();
  ///Api调用进度行为
  final apiController = BehaviorSubject<FetchProcess>();
  final otpResendController = StreamController<bool>();
  ///显示widget逻辑
  final otpResultController = BehaviorSubject<bool>();

  ///sink
  Sink<UserLoginViewModel> get otpSink => otpController.sink;
  Sink<UserLoginViewModel> get loginSink => otpController.sink;
  Sink<bool> get resendOtpSink => otpResendController.sink;

  ///显示widget逻辑
  Stream<bool> get otpResult => otpResultController.stream;

  ///登录结果
  Stream<FetchProcess> get apiResult => apiController.stream;

  LoginBloc() {
    ///监听
    otpController.stream.listen(apiCall);
    otpResendController.stream.listen(resendOtp);
    loginController.stream.listen(apiCall);
  }

  ///api调用
  void apiCall(UserLoginViewModel userLogin) async {
    FetchProcess process = new FetchProcess(loading: true);
    //for progress loading
    ///开始
    apiController.add(process);

    if (userLogin.otp == null) {
      process.type = ApiType.performOTP;
      await userLogin.getOtp(userLogin.phonenumber);
      ///添加结果
      otpResultController.add(userLogin.otpResult);
    } else {
      process.type = ApiType.performLogin;
      await userLogin.performLogin(userLogin);
    }
    ///结束
    process.loading = false;
    process.response = userLogin.apiResult;
    //for error dialog
    apiController.add(process);
    userLogin = null;
  }

  ///resend
  void resendOtp(bool flag) {
    otpResultController.add(false);
  }

  void dispose() {
    otpController.close();
    otpResendController.close();
    apiController.close();
    otpResultController.close();
    loginController.close();
  }
}
