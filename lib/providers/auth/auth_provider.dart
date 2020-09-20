import 'package:arties_flutter_prototype/classes/access_token.dart';
import 'package:arties_flutter_prototype/classes/user.dart';
import 'package:arties_flutter_prototype/providers/request.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/providers/root_provider.dart';
import 'package:arties_flutter_prototype/providers/storage/storage_provider.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/general_data_model.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/global_models_handler.dart';
import 'package:arties_flutter_prototype/service_locator.dart';

class AuthProvider {

  RootProvider rootProvider = locator<RootProvider>();
  StorageProvider storageProvider = locator<StorageProvider>();
  GeneralDataModel generalDataModel = locator<GeneralDataModel>();

  Future<bool> login(String username, String password) async {
    Request request = Request(activityId: "user.login");
    request.addParam("username", username);
    request.addParam("password", password);

    Response response = await rootProvider.callAnonymous(request);

    print(response.code);

    if (response.code != "001S") {
      return false;
    } else {
      User user = User.fromJson(response.data['user']); 
      generalDataModel.loggedUser = user;

      storageProvider.setString(StorageVariables.accessToken, response.data['token']);
      storageProvider.setString(StorageVariables.username, user.username);

      return true;
    }
  }

  Future<Response> registerStep1(String username, String email) async {
    Request request = Request(activityId: "user.register.step1");
    request.addParam("username", username);
    request.addParam("email", email);
    
    return await rootProvider.callAnonymous(request);
  }

  Future<Response> registerStep2(String firstName, String lastName, String country) async {
    Request request = Request(activityId: "user.register.step2");
    request.addParam("firstName", firstName);
    request.addParam("lastName", lastName);
    request.addParam("country", country); 
  
    return await rootProvider.callAnonymous(request);
  }

  Future<Response> registerStep3(String username, String email, String firstName, String lastName, String country, String password) async {
    Request request = Request(activityId: "user.register.step3");
    request.addParam("username", username);
    request.addParam("email", email);
    request.addParam("firstName", firstName);
    request.addParam("lastName", lastName);
    request.addParam("country", country);
    request.addParam("password", password);
  
    return await rootProvider.callAnonymous(request);
  }
}