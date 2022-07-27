import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Home/Controller/home1_cubit.dart';
import '../footer_cubit.dart';
import '../resource/assets_manager.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FooterCubit()..getFooterSection(),
      child: BlocConsumer<FooterCubit, FooterState>(
        listener: (context, state) {},
        builder: (context, state) {
          var footer = FooterCubit.get(context);
          return Container(
            width: double.infinity,
            height: height * .15,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(3, 1),
                end: Alignment(1, 1),
                colors: <Color>[
                  Color(0xff56392D),
                  Color(0xff180701),
                ],
                // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(ImageAssets.logoFotter,
                        height: height * .15),
                    SvgPicture.asset(ImageAssets.logoFotter,
                        height: height * .15)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AutoSizeText(
                          "For any questions",
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffFFE3C5)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.emailIcon,
                                width: width * .015
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "${footer.footerSection.email}",
                              style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffAE957B)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.phoneIcon, width: width * .015
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "${footer.footerSection.phone}",
                              style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffAE957B)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "We are waiting you",
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffFFE3C5)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.locationIcon, width: width * .015
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "${footer.footerSection.location}",
                              style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffAE957B)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.locationIcon, width: width * .015
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            AutoSizeText(
                              "${footer.footerSection.location2}",
                              style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xffAE957B)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Image(image: AssetImage(ImageAssets.dog)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
