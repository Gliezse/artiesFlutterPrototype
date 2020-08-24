import 'package:flutter/material.dart';

class ButtonWithLoading extends StatelessWidget {
  const ButtonWithLoading({
    Key key, 
    @required this.isLoading, 
    @required this.onPressed, 
    @required this.disabled, 
    @required this.text, 
    this.mainAxisAlignment,
  }) : super(key: key);

  final bool isLoading;
  final Function onPressed;
  final bool disabled;
  final String text;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
      children: [
        Container(
          height: 20,
          width: 20,
          child: isLoading ? CircularProgressIndicator() : null,
        ),
        FlatButton(
          onPressed: disabled || isLoading ? null : onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18
            ),
          ),
        ),
      ],
    );
  }
}