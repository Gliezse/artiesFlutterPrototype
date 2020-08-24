import 'package:arties_flutter_prototype/views/register/model/register_step1_model.dart';
import 'package:arties_flutter_prototype/views/scoped_base_view.dart';
import 'package:arties_flutter_prototype/views/widgets/button_with_loading.dart';
import 'package:arties_flutter_prototype/views/widgets/main_container.dart';
import 'package:flutter/material.dart';

class RegisterStep1View extends StatelessWidget {

  static final String route = "/register.step1";

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterStep1Model>(
      embebbedModel: RegisterStep1Model(),
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          title: Container(
            child: Column(
              children: [
                Text(
                  "Registrarse",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: MainContainer(
          child: Form(
            key: model.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Completá estos datos básicos para empezar a crear tu cuenta",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: model.usernameFieldController,
                  autocorrect: false,
                  validator: model.usernameValidator,
                  decoration: InputDecoration(
                    labelText: "Crea un nombre de usuario",
                    helperText: "Debe tener al menos 6 caracteres",
                    errorText: model.usernameFieldErrorText,
                  ),              
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: model.emailFieldController,
                  validator: model.emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Ingresa tu mail",
                    errorText: model.mailFieldErrorText,
                  ),              
                ),
                SizedBox(height: 30),
                ButtonWithLoading(
                  isLoading: model.isBusy, 
                  onPressed: () => model.submitForm(context), 
                  disabled: false, 
                  text: "Continuar"
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}