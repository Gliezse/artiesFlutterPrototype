import 'dart:convert';

import 'package:flutter/material.dart';

class Request {

  final _url = "http://192.168.0.102:2331/api/"; 

  String activityId;
  Map<String, dynamic> bodyParams = Map();
  Map<String, String> headers = Map();

  Request({ @required this.activityId });

  void addParam(String key, dynamic value) {
    bodyParams[key] = value;
  }

  String getEncodedBody() => json.encode(bodyParams);

  String generateUrl() => "$_url$activityId";

}