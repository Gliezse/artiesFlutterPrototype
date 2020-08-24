import 'package:arties_flutter_prototype/service_locator.dart';
import 'package:flutter/material.dart';
import "package:scoped_model/scoped_model.dart";

class BaseView<T extends Model> extends StatefulWidget {
  
  final ScopedModelDescendantBuilder<T> _builder;
  final Function(T) onModelReady;
  final T embebbedModel;

  const BaseView({ ScopedModelDescendantBuilder<T> builder, this.onModelReady, this.embebbedModel }) : _builder = builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Model> extends State<BaseView<T>> {

  T _model;

  @override
  void initState() {
    _model = widget.embebbedModel == null ? locator<T>() : widget.embebbedModel;
    
    if (widget.onModelReady != null) {
      widget.onModelReady(_model);
    } 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
      model: _model,
      child: ScopedModelDescendant<T>(
        builder: widget._builder,
      ),
    );
  }
}