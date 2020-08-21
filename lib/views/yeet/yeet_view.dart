import 'package:arties_flutter_prototype/classes/user.dart';
import 'package:arties_flutter_prototype/scoped_model/models/general/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class YeetView extends StatelessWidget {

  static final String route = "/yeet";

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          title: Text("SALE BIEN"),
        ),
        body: Container(
          child: Center(
            child: Text(
              _buildGreet(model.user),
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ),
        )
      ),
    );
  }

  String _buildGreet(User user) {
    return "Bienvenido, ${user.firstName} ${user.lastName}";
  }
}