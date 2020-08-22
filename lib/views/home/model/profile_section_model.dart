import 'package:arties_flutter_prototype/classes/user.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/providers/user/user_provider.dart';
import 'package:arties_flutter_prototype/scoped_model/models/base_model.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/global_models_handler.dart';
import 'package:arties_flutter_prototype/service_locator.dart';

class ProfileSectionModel extends BaseModel {

  bool isArtist = false;

  UserProvider userProvider = locator<UserProvider>();

  void fetchProfileData() async {
    if (isBusy) return;

    setState(ViewState.Busy);
    
    Response response = await userProvider.fetchProfileData();

    if (response.code != "001S") {
      setState(ViewState.Error);
    } else {
      User user = User.fromJson(response.data["user"]);
      GlobalModelsHandler.setLoggedUser(user);

      isArtist = response.data['isArtist'];

      setState(ViewState.Retrieved);
    }
  } 

}