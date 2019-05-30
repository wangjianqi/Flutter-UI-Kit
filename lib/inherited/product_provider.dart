import 'package:flutter/material.dart';
import 'package:flutter_uikit/logic/bloc/product_bloc.dart';

///InheritedWidget
class ProductProvider extends InheritedWidget {
  final ProductBloc productBloc;
  final Widget child;

  ProductProvider({this.productBloc, this.child}) : super(child: child);

  ///of
  static ProductProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(ProductProvider);

  @override
  bool updateShouldNotify(ProductProvider oldWidget) =>
      productBloc != oldWidget.productBloc;
}
