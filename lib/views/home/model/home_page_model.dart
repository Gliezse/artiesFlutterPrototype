import 'package:arties_flutter_prototype/providers/auth/auth_provider.dart';
import 'package:arties_flutter_prototype/scoped_model/models/base_model.dart';
import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:arties_flutter_prototype/views/yeet/yeet_view.dart';
import 'package:flutter/material.dart';

class HomePageModel extends BaseModel {

  AuthProvider authProvider = locator<AuthProvider>();

  String _username = "";
  String _password = "";

  String get username => _username;
  String get password => _password;

  void setUsername(String username) {
    this._username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    this._password = password;
    notifyListeners();
  }

  bool get canLogin => username.isNotEmpty && password.isNotEmpty; 

  Future submitLogin(BuildContext context) async {
    setState(ViewState.Busy);
    bool success = await authProvider.login(_username, _password);
    if (success) {
      setState(ViewState.Retrieved);
      Navigator.pushReplacementNamed(context, YeetView.route);
    } else {
      setState(ViewState.Error);
    }
  }
}