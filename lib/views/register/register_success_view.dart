import 'package:arties_flutter_prototype/views/widgets/main_container.dart';
import 'package:flutter/material.dart';

class RegisterSuccessView extends StatelessWidget {

  static final String route = "/register.success";

  @override
  Widget build(BuildContext context) {

    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    String name = arguments['firstName'];

    return Scaffold(
      body: MainContainer(
        child: Center(
          child: Text("Ya creaste una cuenta, $name!"),
        ),
      ),
    );
  }
}