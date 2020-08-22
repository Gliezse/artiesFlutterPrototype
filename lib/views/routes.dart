import 'package:arties_flutter_prototype/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:arties_flutter_prototype/views/login/login_view.dart';

Map<String, WidgetBuilder> routes = {
  LoginView.route: (context) => LoginView(),
  HomeView.route: (context) => HomeView(),
};