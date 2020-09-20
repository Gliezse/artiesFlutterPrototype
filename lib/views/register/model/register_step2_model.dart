import 'package:arties_flutter_prototype/classes/country.dart';
import 'package:arties_flutter_prototype/providers/auth/auth_provider.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/scoped_model/models/base_model.dart';
import 'package:arties_flutter_prototype/scoped_model/models/form_base_model.dart';
import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:arties_flutter_prototype/views/register/register_step2_view.dart';
import 'package:arties_flutter_prototype/views/register/register_step3_view.dart';
import 'package:arties_flutter_prototype/views/register/register_success_view.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class RegisterStep2Model extends FormBaseModel {

  AuthProvider authProvider = locator<AuthProvider>();

  TextEditingController firstNameFieldController = new TextEditingController();
  TextEditingController lastNameFieldController = new TextEditingController();

  String firstNameErrorText;
  String lastNameErrorText;
  String countryErrorText;

  List<Country> countries;
  List<dynamic> get countrySelectorOptions => countries.map((country) => country.toJson()).toList();
  String selectorValue;

  String username;
  String email;

  Future submitForm(BuildContext context) async {
    if (isFormValid && !isBusy) {
      setState(ViewState.Busy);

      Country selectedCountry = getSelectedCountry();
      String firstName = firstNameFieldController.text;
      String lastName = lastNameFieldController.text;

      Response response = await authProvider.registerStep2(
        firstName, 
        lastName, 
        selectedCountry.id,
      );

      if (response.isWarning) {
        firstNameErrorText = response.data['firstName'];
        lastNameErrorText = response.data['lastName'];
        countryErrorText = response.data['countryErrorText'];
        setState(ViewState.Error);
      } else {
        setState(ViewState.Retrieved);

        Navigator.pushNamed(
          context, 
          RegisterStep3View.route,
          arguments: {
            "firstName": firstName,
            "lastName": lastName,
            "selectedCountry": selectedCountry,
            "username": username,
            "email": email,
          }
        );
      }
    }
  }

  Country getSelectedCountry() {
    return countries.singleWhere((element) => element.id == selectorValue);
  } 

  void setSelectorValue(String value) {
    selectorValue = value;
    notifyListeners();
  }

  void setLastViewData(Map<String, Object> data) {
    countries = data['countries'];
    username = data['username'];
    email = data['email'];
  }

  Function(String) get nameValidator => Validators.compose([
    Validators.required("Por favor ingresa un nombre de usuario"),
  ]);

  String countryValidator(dynamic e) {
    return e == null ? "Por favor elegí un país" : null;
  }
}