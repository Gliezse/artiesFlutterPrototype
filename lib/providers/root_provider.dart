import 'package:arties_flutter_prototype/classes/access_token.dart';
import 'package:arties_flutter_prototype/providers/request.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/providers/storage/storage_provider.dart';
import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:http/http.dart' as http;

class RootProvider {

  StorageProvider storage = locator<StorageProvider>();

  Future<Response> callAnonymous(Request request) async {
    return await _makeCall(request);
  }
  
  Future<Response> callWithAccessToken(Request request) async {
    AccessToken accessToken = AccessToken(
      token: await storage.getString(StorageVariables.accessToken)
    );
    request.headers['Authorization'] = accessToken.formattedToken;
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