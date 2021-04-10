import 'package:corona/src/bloc/newsBloc.dart';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
export '../bloc/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();
  final newsBloc = NewsBloc();
  Provider({Key key, Widget child}) : super(key: key, child: child);

  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().bloc;
  }

  static NewsBloc newBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().newsBloc;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }
}
