import 'package:arties_flutter_prototype/views/home/home_view.dart';
import 'package:arties_flutter_prototype/views/register/register_step1_view.dart';
import 'package:arties_flutter_prototype/views/register/register_step2_view.dart';
import 'package:arties_flutter_prototype/views/register/register_step3_view.dart';
import 'package:arties_flutter_prototype/views/register/register_success_view.dart';
import 'package:flutter/material.dart';
import 'package:arties_flutter_prototype/views/login/login_view.dart';

Map<String, WidgetBuilder> routes = {
  LoginView.route: (context) => LoginView(),
  RegisterStep1View.route: (context) => RegisterStep1View(),
  RegisterStep2View.route: (context) => RegisterStep2View(),
  RegisterStep3View.route: (context) => RegisterStep3View(),
  RegisterSuccessView.route: (context) => RegisterSuccessView(),
  HomeView.route: (context) => HomeView(),
};