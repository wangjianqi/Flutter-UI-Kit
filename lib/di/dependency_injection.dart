import 'package:flutter_uikit/services/abstract/i_otp_service.dart';
import 'package:flutter_uikit/services/mock/mock_otp_service.dart';
import 'package:flutter_uikit/services/real/real_otp_service.dart';
import 'package:flutter_uikit/services/restclient.dart';

enum Flavor { MOCK, PRO }

//Simple DI
class Injector {
  ///单例
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) async {
    _flavor = flavor;
  }

  factory Injector() => _singleton;

  Injector._internal();

  ///模拟还是正式
  IOTPService get otpService {
    switch (_flavor) {
      ///模拟数据
      case Flavor.MOCK:
        return MockOTPService();
      default:
        ///正式的
        return OTPService(new RestClient());
    }
  }
}
