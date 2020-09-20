import 'package:arties_flutter_prototype/classes/country.dart';
import 'package:arties_flutter_prototype/scoped_model/models/base_model.dart';
import 'package:arties_flutter_prototype/views/register/model/register_step2_model.dart';
import 'package:arties_flutter_prototype/views/register/widgets/register_scaffold.dart';
import 'package:arties_flutter_prototype/views/scoped_base_view.dart';
import 'package:arties_flutter_prototype/views/widgets/button_with_loading.dart';
import 'package:arties_flutter_prototype/views/widgets/main_container.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:selection_menu/selection_menu.dart';

class RegisterStep2View extends StatelessWidget {
  
  static final String route = "/register.step2";
  
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterStep2Model>(
      embebbedModel: RegisterStep2Model(),
      onModelReady: (model) => model.setLastViewData(ModalRoute.of(context).settings.arguments),
      builder: (context, child, model) => RegisterScaffold(
        child: MainContainer(
          child: Form(
            key: model.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ahora continuamos con estos datos personales",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: model.firstNameFieldController,
                  decoration: InputDecoration(
                    labelText: "Tu primer nombre",
                  ),
                  validator: model.nameValidator,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: model.lastNameFieldController,
                  decoration: InputDecoration(
                    labelText: "Tu apellido",
                  ),          
                  validator: model.nameValidator,
                ),
                SizedBox(height: 20),
                DropDownFormField(
                  dataSource: model.countrySelectorOptions,
                  onChanged: model.setSelectorValue,
                  value: model.selectorValue,
                  titleText: "País",
                  hintText: "Toca para seleccionar un país",
                  textField: 'name',
                  valueField: 'id',
                  validator: model.countryValidator,
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
          ),
        ),
      ),
    );
  }
}