import 'package:arties_flutter_prototype/classes/user.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/user_model.dart';
import 'package:arties_flutter_prototype/service_locator.dart';

class UserModelHandler {
  static UserModel userModel = locator<UserModel>();

  static void setUserData(User user) {
    userModel.user = user;
  }
}