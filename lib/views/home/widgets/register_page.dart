import 'package:flutter/material.dart';

class RegisterSection extends StatelessWidget {
  const RegisterSection({
    Key key,
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