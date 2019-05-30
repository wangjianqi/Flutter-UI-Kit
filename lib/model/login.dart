class Login {
  String phonenumber;
  String otp;

  ///登录
  Login({this.phonenumber, this.otp});

  Map<String, dynamic> toJson() => {
        'phonenumber': phonenumber,
        'otp': otp,
      };
}
