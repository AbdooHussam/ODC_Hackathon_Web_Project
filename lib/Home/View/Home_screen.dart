import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:odc_hackathon_web_project/Home/View/Help_them_screen.dart';
import 'package:odc_hackathon_web_project/Home/View/ui/all_animal_cards.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/color_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/text_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';
import 'package:odc_hackathon_web_project/core/widgets/on_hover_button.dart';
import 'package:provider/provider.dart';
import '../../core/constant/mouseRegion.dart';
import '../../core/constant/validator.dart';
import '../../core/resource/size_config.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_button.dart';
import '../../core/widgets/footer_section.dart';
import '../Controller/home1_cubit.dart';
import 'ui/pet-needs_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int moreAnimal = 0;

  late Future _future;

  Future<void> prepareData() async {
    var bloc = Home1Cubit.get(context);
    (bloc.firstSection.body!.isEmpty) ? await bloc.getFirstSection() : null;
    (bloc.secondSection.body!.isEmpty) ? await bloc.getSecondSection() : null;
    (bloc.allPetsList.isEmpty) ? await bloc.getAllPets() : null;
    (bloc.petNeedsList.isEmpty) ? await bloc.getPetNeeds() : null;
  }

  @override
  void initState() {
    _future = prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<Home1Cubit>(context);

    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

    return BlocConsumer<Home1Cubit, Home1State>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = Home1Cubit.get(context);
        return SafeArea(
            child: Scaffold(
          body: Mouse(
            widget: ListView(
              children: [
                Container(
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Image.asset(
                                  ImageAssets.logoAppBar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              CustomTextButton(
                                  text: TextManager.aboutUs,
                                  textStyle: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white),
                                  function: () {
                                    print("AboutUs");
                                  }),
                              CustomTextButton(
                                  text: TextManager.categories,
                                  function: () {
                                    print("categories");
                                  }),
                              CustomTextButton(
                                  text: TextManager.services,
                                  function: () {
                                    print("services");
                                  }),
                              CustomTextButton(
                                  text: TextManager.request,
                                  function: () {
                                    GoRouter.of(context).go("/RequestScreen");
                                    print("request");
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .05,
                        ),
                        CustomButton(
                          text: TextManager.signUp,
                          function: () {},
                          inColor: Colors.transparent,
                          outColor: const Color(0xffFFE3C5),
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .05,
                        ),
                        CustomButton(
                          function: () {},
                          text: TextManager.login,
                          outColor: const Color(0xffFFE3C5),
                          inColor: Colors.white,
                          textColor: Colors.black,
                        ),
                      ]),
                ),
                Container(
                  height: height * .55,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(3, 1),
                      end: Alignment(1, 1),
                      colors: <Color>[
                        Color(0xff56392D),
                        Color(0xff180701),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height * .02),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: width * .22,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "${bloc.firstSection.title}",
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45),
                                  ),
                                  SizedBox(height: height * .02),
                                  AutoSizeText(
                                    "${bloc.firstSection.body}",
                                    maxLines: 7,
                                    style: const TextStyle(
                                        color: Color(0xffC3C3C3), fontSize: 19),
                                  ),
                                  SizedBox(height: height * .02),
                                  SizedBox(
                                    height: height * .06,
                                    width: width * .22,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        GoRouter.of(context).replace('/HlepThemScreen');
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          SizedBox(),
                                          AutoSizeText("Help them",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * .22,
                              child: Image.asset(ImageAssets.dogHomeScreen,
                                  height: 320),
                            ),
                          ]),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/Home2.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Column(
                    children: [
                      SizedBox(height: height * .02),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "images/dogHome2.png",
                              width: width * .3,
                            ),
                            SizedBox(
                              width: width * .22,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "${bloc.secondSection.title}",
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 60),
                                  ),
                                  SizedBox(height: height * .03),
                                  AutoSizeText(
                                    "${bloc.secondSection.body}",
                                    maxLines: 7,
                                    style: const TextStyle(
                                        color: Color(0xffC3C3C3), fontSize: 19),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/Home3.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Column(
                    children: [
                      SizedBox(height: height * .06),
                      const AutoSizeText(
                        "Lets get this right ...",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 45),
                      ),
                      SizedBox(height: height * .05),
                      const AutoSizeText(
                        "What Kind of friennd you looking for?",
                        maxLines: 1,
                        style: TextStyle(color: Colors.black, fontSize: 26),
                      ),
                      SizedBox(height: height * .05),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OnHoverButton(builder: (isHovered) {
                              final color = isHovered
                                  ? const Color(0xffFFE3C5)
                                  : Colors.transparent;
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    color: color,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset("images/dogHome3.svg",
                                          height: height * .1),
                                      const AutoSizeText(
                                        "Dogs",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                            SizedBox(
                              width: width * .05,
                            ),
                            OnHoverButton(builder: (isHovered) {
                              final color = isHovered
                                  ? const Color(0xffFFE3C5)
                                  : Colors.transparent;
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    color: color,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset("images/catHome3.svg",
                                          height: height * .1),
                                      const AutoSizeText(
                                        "Cats",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ]),
                      SizedBox(height: height * .1),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/Home4.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Column(
                    children: [
                      SizedBox(height: height * .06),
                      const AutoSizeText(
                        "Our friends who\nlooking for a house",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 34),
                      ),
                      SizedBox(height: height * .05),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.black,
                                child: IconButton(
                                    onPressed: () {
                                      if (moreAnimal > 0) {
                                        setState(() {
                                          moreAnimal -= 3;
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    ))),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: List.generate(
                                      (bloc.allPetsList.length <= 3)
                                          ? bloc.allPetsList.length
                                          : 3,
                                      (index) => AllAnimalCards(
                                          allPets: bloc.allPetsList[
                                              index + moreAnimal]))),
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.black,
                                child: IconButton(
                                    onPressed: () {
                                      if (moreAnimal <
                                          bloc.allPetsList.length - 3) {
                                        setState(() {
                                          moreAnimal += 3;
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ))),
                          ]),
                      SizedBox(height: height * .1),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/Home3.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Column(
                    children: [
                      SizedBox(height: height * .06),
                      const AutoSizeText(
                        "How to take care of\nyour freiends?",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 38),
                      ),
                      SizedBox(height: height * .05),
                      Wrap(
                          children: List.generate(
                              bloc.petNeedsList.length,
                              (index) => PetNeedsCards(
                                    petNeeds: bloc.petNeedsList[index],
                                  ))),
                      SizedBox(height: height * .1),
                    ],
                  ),
                ),
                FooterSection(
                  height: height,
                  width: width,
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
