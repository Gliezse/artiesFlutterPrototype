import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/base_model.dart';

class BaseScopedModel<T extends BaseModel> extends StatelessWidget {

  Widget child = Container();
  T model;

  BaseScopedModel({ this.child, @required this.model });

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
      model: model,
      child: child
    );
  }

  BaseScopedModel<T> copyWith(Widget newChild) => BaseScopedModel (
    model: model, 
    child: newChild
  );

}