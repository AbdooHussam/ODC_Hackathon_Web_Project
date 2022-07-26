import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  int moreAnimal = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool securePass = true;
  String name = "", email = "", pass = "", phone = "", address = "";
  bool showSpinner = false;
  late Future _future;

  // Future<void> prepareData() async {
  //   var bloc = Home1Cubit.get(context);
  //   (bloc.firstSection.body!.isEmpty) ? await bloc.getFirstSection() : null;
  //   (bloc.secondSection.body!.isEmpty) ? await bloc.getSecondSection() : null;
  //   (bloc.allPetsList.isEmpty) ? await bloc.getAllPets() : null;
  //   (bloc.petNeedsList.isEmpty) ? await bloc.getPetNeeds() : null;
  // }
  //
  // @override
  // void initState() {
  //   _future = prepareData();
  //   super.initState();
  // }

  late PickedFile _image;
  late String picPath = "empty";
  final picker = ImagePicker();
  String base64string = "empty";

  Future takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      _image = pickedFile;
      picPath = _image.path;
      Uint8List imagebytes = await pickedFile.readAsBytes(); //convert to bytes
      base64string = base64.encode(imagebytes); //convert bytes to base64 string
      print(base64string);
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

  bottomsheet() {
    return Container(
      height: 125,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Choose your photo",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.image,
                  size: 30,
                  color: Colors.blueAccent,
                ),
                label: const Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  color: Colors.orange[900],
                  size: 30,
                ),
                label: Text("Camera",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.orange[900],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<Home1Cubit>(context);

    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Mouse(
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
                                        textStyle: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
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
                                child: (picPath == "empty")
                                    ? TextButton.icon(
                                        onPressed: () {
                                          takePhoto(ImageSource.gallery);
                                        },
                                        icon: const Icon(
                                          Icons.image,
                                          size: 30,
                                          color: Colors.blueAccent,
                                        ),
                                        label: const Text(
                                          "Gallery",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      )
                                    : Image.memory(
                                        base64Decode(base64string),
                                      ),
                              ),
                              Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        CustomTextFormField(
                                          controller: emailController,
                                          hitText: "Email",
                                          fieldValidator: emailValidator,
                                        ),
                                        CustomTextFormField(
                                          controller: passController,
                                          hitText: "password",
                                          fieldValidator: passwordValidator,
                                          password: true,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
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
                                            if (_formKey.currentState!
                                                .validate()) {
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
                      FooterSection(height: height, width: width)
                    ],
                  ),
                ),
              ),
            )));
  }
}
