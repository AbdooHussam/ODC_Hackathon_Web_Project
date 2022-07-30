import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:odc_hackathon_web_project/Home/Controller/home1_cubit.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';

import '../../Home/Model/dog_details_model.dart';
import '../../Home/View/Home_screen.dart';
import '../../core/resource/text_manager.dart';
import '../../core/resource/value_manager.dart';
import '../../core/widgets/custom_text_button.dart';
import '../../core/widgets/footer_section.dart';

class DogDetails extends StatefulWidget {
  const DogDetails({required this.details});

  final dogDetails? details;

  @override
  State<DogDetails> createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  final featuredImages = [
    ImageAssets.dogImage,
    ImageAssets.dogImage,
    ImageAssets.dogImage,
  ];

  CarouselController carouselController = CarouselController();
  int _dotindicatoR = 0;
  Color primaryColor = Color(0xff56392D);
  Color secondaryColor = Color(0xffFFE3C5);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: BlocConsumer<Home1Cubit, Home1State>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = Home1Cubit.get(context);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
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
                child: Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: Image.asset(
                                      ImageAssets.logoAppBar,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  CustomTextButton(
                                      text: TextManager.aboutUs,
                                      function: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen()));
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
                                        GoRouter.of(context)
                                            .go("/RequestScreen");
                                        print("request");
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .05,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s28),
                                          side: const BorderSide(
                                              color: Colors.white))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent)),
                              child: const AutoSizeText(TextManager.signUp),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .05,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).go('/loginScreen');
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: const BorderSide(
                                              color: Colors.white))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                              child: const AutoSizeText(TextManager.login,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: cubit.details!.image![0].isEmpty
                                ? Center(
                                    child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: height * .18),
                                        child: const AutoSizeText(
                                          "no available images",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFE3C5)),
                                        )))
                                : CarouselSlider(
                                    carouselController: carouselController,
                                    // Give the controller
                                    options: CarouselOptions(
                                        autoPlay: false,
                                        onPageChanged: (index, reason) {
                                          print('index ${index}');
                                          setState(() {
                                            _dotindicatoR = index;
                                            print('_current ${_dotindicatoR}');
                                          });
                                        }),

                                    items: cubit.details!.image!.map((e) =>
                                        Image.memory(base64Decode(e))
                                    ).toList(),
                                  ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xffFFE3C5)),
                                child: IconButton(
                                  onPressed: () {
                                    // Use the controller to change the current page
                                    carouselController.previousPage();
                                  },
                                  icon: Icon(Icons.arrow_back_ios_new_outlined,
                                      size: 25),
                                ),
                              )),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color(0xffFFE3C5)),
                                child: IconButton(
                                  onPressed: () {
                                    // Use the controller to change the current page
                                    carouselController.nextPage();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff56392D),
                                    size: 25,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 33,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: featuredImages.length,
                          itemBuilder: (context, i) {
                            return Container(
                              width: 30.0,
                              height: 30.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _dotindicatoR == i
                                    ? secondaryColor
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 30),
                child: Text(
                  cubit.details!.name.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: screenSize.width,
                margin: EdgeInsets.only(left: 30, top: 20, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Share by: ',
                          style: TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                          ),
                        ),
                        Text(
                          cubit.details!.user!.firstName.toString(),
                          style: TextStyle(
                              fontSize: 23,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(

                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  content: Container(
                                    height: 270,
                                    width: 400,
                                    padding: EdgeInsets.only(top: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // CircleAvatar(
                                        //   backgroundImage: AssetImage(
                                        //       'assets/image/profile.png'),
                                        //   radius: 60,
                                        // ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          cubit.details!.user!.firstName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Phone',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          cubit.details!.phone.toString(),
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xffAE957B),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: primaryColor,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.phone,
                            color: primaryColor,
                            size: 30,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                child: Text(
                  cubit.details!.description.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    color: primaryColor,
                  ),
                ),
                padding: EdgeInsets.only(left: 30, top: 30),
              ),
              Container(
                  color: Color(0xffF1F1F1),
                  width: screenSize.width,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
                  child: Text(
                    cubit.details!.gender.toString(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  )),
              Padding(
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(left: 30, top: 30),
              ),
              Padding(
                child: Text(
                  cubit.details!.description.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                  ),
                ),
                padding: EdgeInsets.only(left: 30, top: 20),
              ),
              Container(
                  color: Color(0xffF1F1F1),
                  width: screenSize.width,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 50,
                        color: primaryColor,
                      ),
                      Text(
                        cubit.details!.careBehavior.toString(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      )
                    ],
                  )),
              Padding(
                child: Text(
                  'Meet Elsa',
                  style: TextStyle(
                      fontSize: 30,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(left: 30, top: 30),
              ),
              Padding(
                child: Text(
                  cubit.details!.description.toString(),
                  style: TextStyle(
                      fontSize: 20, color: primaryColor, letterSpacing: 2),
                ),
                padding: EdgeInsets.only(left: 30, top: 20),
              ),
              SizedBox(height: height*.1),
              FooterSection(height: height, width: width)
            ],
          ),
        );
      },
    ));
  }
}
