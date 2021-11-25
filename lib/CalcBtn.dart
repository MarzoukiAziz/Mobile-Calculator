import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;

  const CalcBtn({
    Key key,
    this.text,
    this.fillColor,
    this.textColor = Colors.white,
    this.textSize = 28,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 65,
      height: 65,
      //A TextButton widget is just a text label displayed on a zero elevation Material widget.
      // By default, it doesn’t have visible borders and reacts to touches by filling with a background color.
      child: TextButton(
        onPressed: () {
          callback(text);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
        style: TextButton.styleFrom(
            backgroundColor: fillColor != null ? fillColor : null,
            primary: textColor,
            //Creates a rounded rectangle border.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            )),
      ),
    );
  }
}
