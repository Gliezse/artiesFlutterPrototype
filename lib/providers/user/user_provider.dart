import 'package:arties_flutter_prototype/classes/user.dart';
import 'package:arties_flutter_prototype/providers/request.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/providers/root_provider.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/global_models_handler.dart';
import 'package:arties_flutter_prototype/service_locator.dart';

class UserProvider {
  RootProvider rootProvider = locator<RootProvider>();

  Future<Response> fetchProfileData() async {
    Request request = Request(
      activityId: "user.getProfile"
    );

    User loggedUser = GlobalModelsHandler.getLoggedUser();

    request.addParam("username", loggedUser?.username);

    Response response = await rootProvider.callWithAccessToken(request);

    return response;
  }


}