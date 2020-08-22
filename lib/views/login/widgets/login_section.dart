import 'package:arties_flutter_prototype/views/login/model/login_page_model.dart';
import 'package:flutter/material.dart';

class LoginSection extends StatelessWidget {
  final LoginPageModel model;

  const LoginSection({
    this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius radius = Radius.circular(35);
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        _buildBottomContent(size, context, radius),
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 60,),
                Text("Arties", style: TextStyle(
                  fontFamily: "Karamell",
                  fontSize: size.height * 0.2,
                  color: Theme.of(context).primaryColor,
                )),
                SizedBox(height: size.height * 0.05),
                _buildForm(context)
              ],
            ),
          ),
        )
      ]
    );
  }

  Container _buildBottomContent(Size size, BuildContext context, Radius radius) {
    return Container(
        margin: EdgeInsets.only(top: size.height * 0.9),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¿Sos nuevo?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down, 
                color: Colors.white
              )
            ],
          ),
        ),
      );
  }

  Widget _buildForm(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Text(
            "Iniciá sesión",
            style: TextStyle(
              fontSize: 25,
            )  
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hoverColor: Colors.red,
              labelText: "Nombre de usuario"
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: model.setUsername
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hoverColor: Colors.red,
              labelText: "Contraseña"
            ),
            onChanged: model.setPassword
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 20,
                width: 20,
                child: model.isBusy ? CircularProgressIndicator() : null,
              ),
              FlatButton(
                onPressed: model.isBusy || !model.canLogin ? null : () => model.submitLogin(context),
                child: Text(
                  "Continuar",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}