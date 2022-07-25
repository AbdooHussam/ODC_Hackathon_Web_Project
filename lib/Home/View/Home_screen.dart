import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/color_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/text_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';
import 'package:odc_hackathon_web_project/core/widgets/on_hover_button.dart';

import 'package:provider/provider.dart';

import '../../core/constant/mouseRegion.dart';
import '../../core/constant/validator.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset pointer = const Offset(300, 300);
  Color backgroundColor = Colors.yellow;
  bool isLogoHovering = false;
  bool isInfoHovering = false;
  bool isTwitterHovering = false;
  bool isGithubHovering = false;
  bool isCodePenHovering = false;
  bool isLinkedinHovering = false;
  int mainItemHover = 0;
  bool securePass = true;
  String name = "", email = "", pass = "", phone = "", address = "";
  bool showSpinner = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(

            body: Mouse(widget: ListView(
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
                  child:Row(
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
                      ]) ,
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
                                  const AutoSizeText(
                                    "asdasdasd",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 60),
                                  ),
                                  const AutoSizeText(
                                    "asdasdaasdsadsadsadsadasdsadasdasdasdasdsadasdadsd",
                                    maxLines: 7,
                                    style: TextStyle(
                                        color: Color(0xffC3C3C3), fontSize: 19),
                                  ),
                                  SizedBox(
                                    height: height * .06,
                                    width: width * .22,
                                    child: ElevatedButton(
                                      onPressed: () {},
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
                            Image.asset("images/dogHome2.png", height: 400),
                            SizedBox(
                              width: width * .22,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AutoSizeText(
                                    "About Petology",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 60),
                                  ),
                                  SizedBox(height: height * .03),
                                  const AutoSizeText(
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy "
                                        "eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata",
                                    maxLines: 7,
                                    style: TextStyle(
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
                                  ? Color(0xffFFE3C5)
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
                                  ? Color(0xffFFE3C5)
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
                    ],
                  ),
                ),
              ],
            ),) ,));
  }
}
