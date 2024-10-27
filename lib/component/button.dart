import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String title;
  final TextStyle textStyle;
  final Function() onPressed;
  final double height;
  final double width;

  const PrimaryButton({
    required this.buttonColor,
    required this.title,
    required this.textStyle,
    required this.onPressed,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(14.0),
        elevation: 0,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(14.0),
                child: Center(
                  child: Text(
                    title,
                    style: textStyle,
                  ),
                )),
          ),
        ));
  }
}
