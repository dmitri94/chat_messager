import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  // это у нас созданный widget для того чтобы не дублировать код

  RoundedButton({this.color, this.title, @required this.onPress});
  final Color color;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  } // это было сделано с помощью Widgeta
}
