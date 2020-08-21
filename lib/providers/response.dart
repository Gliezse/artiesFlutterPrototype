import 'dart:convert';

import 'package:http/http.dart' as http;

class Response {

  String code;
  Map<String, dynamic> data;

  Response({ this.code, this.data }); 

  factory Response.fromJson(Map<String, dynamic> json) => Response(
      code: json["code"],
      data: json["data"],
  );

  factory Response.fromHttpResponse(http.Response response) {
    Map responseBody = json.decode(response.body);

    String code = responseBody['code'];
    Map<String, dynamic> data = responseBody['data'];

    return Response(
      code: code,
      data: data
    );  
  }


}