import 'package:arties_flutter_prototype/providers/request.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:http/http.dart' as http;

class RootProvider {

  Future<Response> callAnonymous(Request request) async {
    return await _makeCall(request);
  }

  Future<Response> _makeCall(Request request) async {
    request.headers['content-type'] = "application/json";
    request.headers['accept'] = "application/json";

    http.Response resp = await http.post(
      request.generateUrl(),
      body: request.getEncodedBody(),
      headers: request.headers
    );

    final r = Response.fromHttpResponse(resp);
  
    return r;
  }
}