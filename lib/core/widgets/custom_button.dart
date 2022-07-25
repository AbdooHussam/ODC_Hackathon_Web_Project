import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  Function? function;
  Color? inColor;
  Color? outColor;
  Color? textColor;

  CustomButton({
    Key? key,
    required this.function,
    required this.text,
    required this.outColor,
    required this.inColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function!();
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: outColor!))),
          backgroundColor: MaterialStateProperty.all<Color>(inColor!)),
      child: AutoSizeText(text.toString(),
          style: TextStyle(color: textColor!, fontWeight: FontWeight.bold)),
    );
  }
}
