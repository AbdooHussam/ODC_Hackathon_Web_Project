import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_hackathon_web_project/Home/Model/all_pets_model.dart';

import '../../../core/widgets/custom_button.dart';

class AllAnimalFilterCards extends StatelessWidget {
  const AllAnimalFilterCards(this.allPets);

  final AllPetsModel allPets;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 75,right: 75,top: 40),
      decoration: BoxDecoration(
          color: Color(0xffEAEAEA),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            (allPets.image!.isEmpty)
                ? const AutoSizeText(
                    "Image Error",
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                : Image.memory(base64Decode(allPets.image![0]),
                    height: height * .25, width: width * .15),
            SizedBox(height: height * .02),
            AutoSizeText(
              "${allPets.name}",
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * .02),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: const BorderSide(color: Color(0xffFFE3C5)))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff492F24))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: AutoSizeText("Read more",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height: height * .02),
            AutoSizeText(
              "by ${allPets.user!.firstName}",
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
