import 'package:arties_flutter_prototype/classes/access_token.dart';
import 'package:arties_flutter_prototype/classes/user.dart';
import 'package:arties_flutter_prototype/providers/request.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/providers/root_provider.dart';
import 'package:arties_flutter_prototype/providers/storage/storage_provider.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/user_model_handler.dart';
import 'package:arties_flutter_prototype/service_locator.dart';

class AuthProvider {

  RootProvider rootProvider = locator<RootProvider>();
  StorageProvider storageProvider = locator<StorageProvider>();

  Future<bool> login(String username, String password) async {
    Request request = Request(activityId: "user.login");
    request.addParam("username", username);
    request.addParam("password", password);

    Response response = await rootProvider.callAnonymous(request);

    if (response.code != "001S") {
      return false;
    } else {
      storageProvider.setString(StorageVariables.accessToken, response.data['token']);

      User user = User.fromJson(response.data['user']); 
      UserModelHandler.setUserData(user);
      return true;
    }
  }
}