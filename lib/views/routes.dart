import 'package:arties_flutter_prototype/views/yeet/yeet_view.dart';
import 'package:flutter/material.dart';
import 'package:arties_flutter_prototype/views/home/home_view.dart';

Map<String, WidgetBuilder> routes = {
  HomeView.route: (context) => HomeView(),
  YeetView.route: (context) => YeetView(),
};