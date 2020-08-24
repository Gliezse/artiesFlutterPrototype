import 'package:arties_flutter_prototype/views/login/model/login_page_model.dart';
import 'package:flutter/material.dart';

class RegisterSection extends StatelessWidget {

  final LoginPageModel model;

  const RegisterSection({
    Key key,
    this.model,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            color: Theme.of(context).primaryColor
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Registrate", 
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white
                    )
                  ),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.green
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}