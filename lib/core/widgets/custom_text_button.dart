import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String? text;
  Function? function;
  TextStyle? textStyle;

  CustomTextButton(
      {Key? key,
      required this.text,
      required this.function,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 15)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextButton(
        onPressed: () {
          function!();
        },
        child: AutoSizeText(
          text!,
          maxLines: 1,
          style: textStyle,
        ),
      ),
    );
  }
}
