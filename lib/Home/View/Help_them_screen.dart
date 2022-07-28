import 'dart:convert';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:odc_hackathon_web_project/Home/View/ui/all_animal_cards.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/color_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/text_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';
import 'package:odc_hackathon_web_project/core/widgets/on_hover_button.dart';
import 'package:provider/provider.dart';
import '../../Authentication/View/widget/componats.dart';
import '../../core/constant/mouseRegion.dart';
import '../../core/constant/text_FormField.dart';
import '../../core/constant/validator.dart';
import '../../core/resource/size_config.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_button.dart';
import '../../core/widgets/footer_section.dart';
import '../Controller/home1_cubit.dart';
import 'ui/pet-needs_cards.dart';


class HelpThemScreen extends StatefulWidget {
  const HelpThemScreen({Key? key}) : super(key: key);

  @override
  State<HelpThemScreen> createState() => _HelpThemScreenState();
}

class _HelpThemScreenState extends State<HelpThemScreen> {
  var items = ["Dog", "Cat"];
  // Location location = new Location();

  bool  ?_serviceEnabled;



  String dropdownvalue = 'Dog';
  TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late PickedFile _image;
  late String picPath = "empty";
  final picker = ImagePicker();
  String base64string = "empty";
  Future takePhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = pickedFile;
      picPath = _image.path;

      Uint8List imagebytes = await pickedFile.readAsBytes(); //convert to bytes
      base64string = base64.encode(imagebytes); //convert bytes to base64 string
      //print(base64string);

      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No image selected',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.pink,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocConsumer<Home1Cubit, Home1State>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = Home1Cubit.get(context);
        return Mouse(
          widget: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/backHelp.png'),
              fit: BoxFit.fill,
            )),
            child: SingleChildScrollView(
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
                                        color: Colors.white),
                                    function: () {
                                      GoRouter.of(context).go('/HomeScreen');
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
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .02,
                          ),
                          AutoSizeText(
                            "Help your friend",
                            style: GoogleFonts.lato(fontSize: AppSize.s40),
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Center(
                            child: (base64string == "empty")
                                ? IconButton(
                                    iconSize: 60,
                                    onPressed: () {
                                      takePhoto();
                                    },
                                    icon: const Icon(
                                      Icons.photo_camera,
                                      color: Colors.black,
                                    ),
                                  )
                                : Image.memory(
                                    base64Decode(base64string),
                                    height: height * .3,
                                  ),
                          ),
                          Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 15,
                                                offset: Offset(0, 10),
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: DropdownButton(
                                              isExpanded: true,
                                              isDense: false,
                                              underline: const SizedBox(),

                                              // Initial Value
                                              value: dropdownvalue,

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (newValue) {
                                                setState(() {
                                                  dropdownvalue =
                                                      newValue.toString();
                                                });
                                              },
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    Container(
                                      height: height * .08,
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 15,
                                            offset: Offset(0, 10),
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                "Location",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () async{


                                                  },
                                                  icon: Icon(Icons.location_on))
                                            ]),
                                      ),
                                    ),
                                    CustomTextFormField(
                                      controller: phoneController,
                                      hitText: "Phone number",
                                      fieldValidator: requireValidator,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          int categoryId11;
                                          String base64string22;
                                          (dropdownvalue == "Dog")
                                              ? categoryId11 = 1
                                              : categoryId11 = 2;

                                          base64string22 =
                                              "data:image/png;base64,${base64string}";
                                          print(base64string22);
                                          await bloc.postPets(
                                              categoryId: categoryId11,
                                              imageBase64: base64string22,
                                              location: "Cairo",
                                              phoneNumber:
                                                  phoneController.text);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xff492F24),
                                        fixedSize: Size(width / 2, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: AutoSizeText(
                                        "Send",
                                        style: GoogleFonts.lato(
                                            color: const Color(0xffFFE3C5),
                                            fontSize: AppSize.s28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          // await cubit.login(
                                          //     email: emailController
                                          //         .text,
                                          //     password:
                                          //     passController
                                          //         .text,
                                          //     context: context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffFFE3C5),
                                        fixedSize: Size(width / 2, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      child: AutoSizeText(
                                        "Call",
                                        style: GoogleFonts.lato(
                                            color: const Color(0xff492F24),
                                            fontSize: AppSize.s28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  FooterSection(height: height, width: width),
                  SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
