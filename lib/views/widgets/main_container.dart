import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {

  final Widget child;
  final EdgeInsets customEdgeInsets;

  const MainContainer({Key key, @required this.child, this.customEdgeInsets}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: customEdgeInsets ?? EdgeInsets.all(16),
      child: child,
    );
  }
}