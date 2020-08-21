import 'package:arties_flutter_prototype/scoped_model/base_scoped_model.dart';
import 'package:flutter/material.dart';

class ScopedModelTree extends StatelessWidget {

  final List<BaseScopedModel> scopedModels;
  final Widget child;

  ScopedModelTree({ @required this.child, @required this.scopedModels });

  @override
  Widget build(BuildContext context) {

    Widget tree = child;

    for (BaseScopedModel scopeModel in scopedModels) {
      tree = scopeModel.copyWith(tree);
    }

    return tree;
  }
}