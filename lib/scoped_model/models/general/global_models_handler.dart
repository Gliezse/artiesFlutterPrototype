import 'package:arties_flutter_prototype/classes/user.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/general_data_model.dart';
import 'package:arties_flutter_prototype/service_locator.dart';

class GlobalModelsHandler {
  static GeneralDataModel generalDataModel = locator<GeneralDataModel>();

  static User getLoggedUser() {
    return generalDataModel.loggedUser;
  }

  static void setLoggedUser(User user) {
    generalDataModel.loggedUser = user;
  }
}