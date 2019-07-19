import 'package:flutter/material.dart';

class LoginProvider extends InheritedWidget {
  ///在子widget执行回调
  final Function validationErrorCallback;
  final Widget child;

  LoginProvider({this.validationErrorCallback, this.child})
      : super(child: child);

  static LoginProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(LoginProvider);

  ///是否通知
  @override
  bool updateShouldNotify(LoginProvider oldWidget) =>
      validationErrorCallback != oldWidget.validationErrorCallback;
}
