import 'package:flutter/material.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius radius = Radius.circular(35);
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
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
        ),
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
                Container(
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
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hoverColor: Colors.red,
                          labelText: "Contraseña"
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            onPressed: (){},
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
                )
              ],
            ),
          ),
        )
      ]
    );
  }
}