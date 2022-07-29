import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_hackathon_web_project/Home/Model/all_pets_model.dart';

import '../../../core/widgets/custom_button.dart';
import '../../Controller/home1_cubit.dart';

class AllAnimalCards extends StatelessWidget {
  const AllAnimalCards({Key? key, required this.allPets, required this.cubit})
      : super(key: key);
  final AllPetsModel allPets;
  final Home1Cubit cubit;

  // Image imageFromBase64String(String base64String) {
  //   return Image.memory(base64Decode(base64String));
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                    height: height * .35, width: width * .15),
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
            CustomButton(
              text: "Read more",
              function: () async {
                await cubit.getDogDetails(
                    id: allPets.id.toString(), context: context);
                print(allPets.id);
              },
              inColor: Colors.white,
              outColor: const Color(0xffFFE3C5),
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
