import 'package:arties_flutter_prototype/scoped_model/models/base_model.dart';
import 'package:flutter/cupertino.dart';
abstract class FormBaseModel extends BaseModel {

  final formKey = GlobalKey<FormState>();

  bool get isFormValid => formKey.currentState.validate();

}