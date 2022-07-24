import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
   String ?text;
   Function? function;
    CustomTextButton({Key? key,
    required this.text,
    required this.function
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextButton(
        onPressed: (){
          function!();
        },
        child:  AutoSizeText(
          text!,
          maxLines: 1,
          style:
          TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}