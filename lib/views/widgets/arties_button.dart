import 'package:flutter/material.dart';

class ArtiesButton extends StatelessWidget {
  const ArtiesButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(vertical: 10),
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),

        ),
      ),
    );
  }
}