import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_hackathon_web_project/Home/Model/all_pets_model.dart';
import '../../../core/widgets/custom_button.dart';
import '../../Model/pet-needs_model.dart';

class PetNeedsCards extends StatelessWidget {
  const PetNeedsCards({
    Key? key,
    required this.petNeeds,
  }) : super(key: key);
  final PetNeedsModel petNeeds;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70,vertical: 10),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/backPetNeeds.png'),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            (petNeeds.imageUrl!.isEmpty)
                ? const AutoSizeText(
                    "Image Error",
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                : Image.network(
                    petNeeds.imageUrl!,
                    height: height * .1,
                    width: width * .1,
                    errorBuilder: (context, exception, stackTrace) {
                      return AutoSizeText(
                        "Image Error",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
            SizedBox(height: height * .02),
            AutoSizeText(
              "${petNeeds.title}",
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: height * .02),
            // CustomButton(
            //   text: "Read more",
            //   function: () {},
            //   inColor: Colors.white,
            //   outColor: const Color(0xffFFE3C5),
            //   textColor: Colors.black,
            // ),
          ],
        ),
      ),
    );
  }
}
