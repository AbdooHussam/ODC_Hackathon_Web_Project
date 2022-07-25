import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final  String hitText;
  final FormFieldValidator fieldValidator;
  bool password;
  CustomTextFormField({
    required this.controller,
    required this.hitText,
    required this.fieldValidator,
    this.password = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration:
        const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: TextFormField(
          obscureText: password,
          validator:  fieldValidator,
          controller:controller ,
          decoration: InputDecoration(
            hintText: hitText,
            fillColor: Colors.white,
            filled: true,
            border:
            OutlineInputBorder(
              borderRadius:
              BorderRadius
                  .circular(32.0),
            ),
            focusedBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius
                  .circular(25.0),
              borderSide:
              const BorderSide(),
            ),
            enabledBorder:
            OutlineInputBorder(
              borderRadius:
              BorderRadius
                  .circular(25.0),
              borderSide:
              const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}