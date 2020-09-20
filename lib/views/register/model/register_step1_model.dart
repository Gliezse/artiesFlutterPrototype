import 'package:arties_flutter_prototype/classes/country.dart';
import 'package:arties_flutter_prototype/providers/auth/auth_provider.dart';
import 'package:arties_flutter_prototype/providers/response.dart';
import 'package:arties_flutter_prototype/scoped_model/models/base_model.dart';
import 'package:arties_flutter_prototype/scoped_model/models/form_base_model.dart';
import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:arties_flutter_prototype/views/register/register_step2_view.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class RegisterStep1Model extends FormBaseModel {

  AuthProvider authProvider = locator<AuthProvider>();

  TextEditingController usernameFieldController = new TextEditingController();
  TextEditingController emailFieldController = new TextEditingController();

  String usernameFieldErrorText;
  String mailFieldErrorText;

  Future submitForm(BuildContext context) async {

    String username = usernameFieldController.text;
    String email = emailFieldController.text;

    if (isFormValid && !isBusy) {
      setState(ViewState.Busy);

      Response response = await authProvider.registerStep1(username, email);

      if (response.isWarning) {
        usernameFieldErrorText = response.data['username'];
        mailFieldErrorText = response.data['email'];

        setState(ViewState.Error);
      } else if (response.isSuccess) {

        List<Country> countries = List();

        (response.data['countries'] as List<dynamic>).forEach((element) {
          countries.add(
            Country.fromJson(element)
          );
        });

        setState(ViewState.Retrieved);

        Navigator.pushNamed(
          context, 
          RegisterStep2View.route,
          arguments: {
            "countries": countries,
            "username": username,
            "email": email,
          }
        );
      }
    }

  }

  Function(String) get usernameValidator => Validators.compose([
    Validators.required("Por favor ingresa un nombre de usuario"),
    Validators.minLength(6, "El nombre de usuario debe contener al menos 6 caracteres")
  ]);

  Function(String) get emailValidator => Validators.compose([
    Validators.required("Por favor ingresá un mail"),
    Validators.email("Mail invalido"),
  ]);
}