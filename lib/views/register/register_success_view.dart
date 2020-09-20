import 'package:arties_flutter_prototype/views/widgets/full_width_button.dart';
import 'package:arties_flutter_prototype/views/widgets/main_container.dart';
import 'package:flutter/material.dart';

import 'widgets/register_scaffold.dart';

class RegisterSuccessView extends StatelessWidget {

  static final String route = "/register.success";

  @override
  Widget build(BuildContext context) {

    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    String name = arguments['firstName'];

    return RegisterScaffold(
      child: MainContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Icon(
                    Icons.check_circle,
                    color: Colors.lightGreen,
                    size: 100,
                  ),
                  Text(
                    "¡Felicidades, $name!",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 30
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Ya creaste tu cuenta exitosamente",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "¡Empezá a usarla ya!",
                  ),
                  FullWidthButton(
                    onPressed: () => Navigator.pop(context),
                    text: "Logearse",
                  ),
                  SizedBox(height: 40)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}