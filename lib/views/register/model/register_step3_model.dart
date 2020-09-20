import 'package:arties_flutter_prototype/classes/country.dart';
import 'package:arties_flutter_prototype/providers/auth/auth_provider.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/scoped_model/models/base_model.dart';
import 'package:arties_flutter_prototype/scoped_model/models/form_base_model.dart';
import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:arties_flutter_prototype/views/register/register_success_view.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../login/login_view.dart';

class RegisterStep3Model extends FormBaseModel {

  AuthProvider authProvider = locator<AuthProvider>();

  String username;
  String email;
  String firstName;
  String lastName;
  Country country;

  TextEditingController passwordFieldController = new TextEditingController();
  TextEditingController passwordConfirmationFieldController = new TextEditingController();

  String passwordErrorText;
  String passwordConfirmationErrorText;

  void setLastViewData(Map<String, Object> data) {
    username = data['username'];
    email = data['email'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    country = data['selectedCountry'];
  }

  submitForm(BuildContext context) async {
    if (isFormValid && !isBusy) {
      setState(ViewState.Busy);

      String password = passwordFieldController.text;

      Response response = await authProvider.registerStep3(username, email, firstName, lastName, country.id, password);

      if (response.isWarning) {
        passwordErrorText = response.data['password'];
        setState(ViewState.Error);
      } else {
        setState(ViewState.Retrieved);

        Navigator.pushNamedAndRemoveUntil(
          context, 
          RegisterSuccessView.route,
          ModalRoute.withName(LoginView.route),
          arguments: {
            "firstName": firstName,
          }
        );
      }

    }
  }

  Function(String) get passwordValidator => Validators.compose([
    Validators.required("Ingresá una contrseña"),
    Validators.minLength(6, "Debe tener al menos 6 caracteres"),
  ]);

  String passwordConfirmationValidator(String value) {
    if (value == null || value.isEmpty) {
      return "Volvé a ingresar la contraseña";
    }

    if (value != passwordFieldController.text) {
      return "Las contraseñas no coinciden";
    }

    return null;
  }

}