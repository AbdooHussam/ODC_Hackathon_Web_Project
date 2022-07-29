import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DogDetails extends StatefulWidget {
  const DogDetails({Key? key}) : super(key: key);

  @override
  State<DogDetails> createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  final featuredImages = [
    'assets/image/dogType.svg',
    'assets/image/dogType.svg',
    'assets/image/dogType.svg'
  ];
  CarouselController carouselController = CarouselController();
  int _dotindicatoR = 0;
   Color primaryColor = Color(0xff56392D);
   Color secondaryColor = Color(0xffFFE3C5);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
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
                    SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: CarouselSlider(
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

                              items: featuredImages.map((featuredImage) {
                                return SvgPicture.asset(
                                  featuredImage,
                                );
                              }).toList(),
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
                                    color:  Color(0xffFFE3C5)),
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
                                    color:  Color(0xffFFE3C5)),
                                child: IconButton(
                                  onPressed: () {
                                    // Use the controller to change the current page
                                    carouselController.nextPage();
                                  },
                                  icon: Icon(
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
                              margin: EdgeInsets.symmetric(
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
                  'Elsa',
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
                          'Kamal magdy ',
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
                              builder: (ctx) =>

                                  AlertDialog(
                                      elevation: 6,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      content: Container(

                                        height: 270,
                                        width: 400,
                                        padding: EdgeInsets.only(top: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/image/profile.png'),
                                              radius: 60,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Kamal Magdy',
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
                                              '(+20)01148293938',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xffAE957B),fontWeight: FontWeight.bold
                                              ),
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
                  'Domestic Short Hair  Fredericton, NB',
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
                    'Adult  Female  Medium  Tabby (Brown / Chocolate)',
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
                  '''
HOUSE-TRAINED
Yes
HEALTH
Vaccinations up to date, spayed / neutered.
GOOD IN A HOME WITH
Other cats.
PREFERS A HOME WITHOUT
Children.
                  
                  
                  ''',
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
                        ''' 
                        
    Petfinder recommends that you should always take reasonable
    security steps before making adabtion.
                    ''',
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
                  '''
Hi,
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita
 kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea.
                  
                  ''',
                  style: TextStyle(
                      fontSize: 20, color: primaryColor, letterSpacing: 2),
                ),
                padding: EdgeInsets.only(left: 30, top: 20),
              ),
              Image.asset(
                'assets/image/footer3.jpg',
                fit: BoxFit.fill,
              )
            ],
          ),
        ));
  }
}