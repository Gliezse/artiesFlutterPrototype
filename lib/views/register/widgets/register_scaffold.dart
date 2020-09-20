import 'package:flutter/material.dart';

class RegisterScaffold extends StatelessWidget {
  
  final Widget child;

  RegisterScaffold({Key key, @required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: child
      );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
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
        leading: Container(),
      );
  }
}