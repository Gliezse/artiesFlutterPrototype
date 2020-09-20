import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {

  final bool isLoading;
  final Function onPressed;
  final bool disabled;
  final String text;

  const FullWidthButton({
    Key key,
    this.isLoading,
    @required this.onPressed,
    this.disabled,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(10),
        child: Text(
          text??"pepe",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Poppins",
            color: Colors.white,
          ),
        ),
        color: Theme.of(context).primaryColor,
        onPressed: disabled??false ? null : onPressed,
      ),
    );
  }
}
