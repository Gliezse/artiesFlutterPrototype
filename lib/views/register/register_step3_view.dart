import 'package:arties_flutter_prototype/views/register/model/register_step3_model.dart';
import 'package:arties_flutter_prototype/views/register/widgets/register_scaffold.dart';
import 'package:arties_flutter_prototype/views/scoped_base_view.dart';
import 'package:arties_flutter_prototype/views/widgets/button_with_loading.dart';
import 'package:arties_flutter_prototype/views/widgets/main_container.dart';
import 'package:flutter/material.dart';

class RegisterStep3View extends StatelessWidget {

  static final String route = "/register.step3";

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterStep3Model>(
      embebbedModel: RegisterStep3Model(),
      onModelReady: (model) => model.setLastViewData(ModalRoute.of(context).settings.arguments),
      builder: (context, child, model) => RegisterScaffold(
        child: MainContainer(
          child: Form(
            key: model.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ya casi terminamos, ${model.firstName}.\nSolo falta elegir una contraseña segura para tu cuenta",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  obscureText: true,
                  controller: model.passwordFieldController,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                  ),
                  validator: model.passwordValidator,
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: model.passwordConfirmationFieldController,
                  decoration: InputDecoration(
                    labelText: "Reingresá la contraseña",
                  ),          
                  validator: model.passwordConfirmationValidator,
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