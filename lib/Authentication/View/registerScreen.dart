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
import 'package:odc_hackathon_web_project/Authentication/View/widget/componats.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/color_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/text_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';
import 'package:odc_hackathon_web_project/core/widgets/footer_section.dart';

import 'package:provider/provider.dart';

import '../../core/constant/mouseRegion.dart';
import '../../core/constant/text_FormField.dart';
import '../../core/constant/validator.dart';
import '../../core/widgets/custom_text_button.dart';
import '../auth_cubit.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController =  TextEditingController();
  TextEditingController lastNameController  =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController passController  =  TextEditingController();
  TextEditingController rePasswordController  =  TextEditingController();
  TextEditingController county       =  TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var items = [
   'Egypt', "Sudia arabia"
  ];
  int mainItemHover = 0;
  bool securePass = true;
  String name = "", email = "", pass = "", phone = "", address = "";
  bool showSpinner = false;
  final _key = GlobalKey<FormState>();
  String dropdownvalue = 'Egypt';

  @override
  Widget build(BuildContext context) {
    final iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    double h = MediaQuery.of(context).size.height * .02;
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var api = Provider.of<UserInformation>(context);
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AuthCubit.get(context);
    return ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Mouse(
              widget: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(

                          child: Container(
                            width: width * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 2),
                                borderRadius: BorderRadius.circular(30)),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height * .05,
                                    ),
                                    AutoSizeText(
                                      TextManager.signUp,
                                      style: GoogleFonts.lato(
                                          fontSize: AppSize.s40,fontWeight: FontWeight.bold),
                                    ),
                                    Form(
                                        key: _formKey,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * .02,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                      Color(0xff2F4582),
                                                      fixedSize:
                                                      Size(width / 5, 60),
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            30.0),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                      children: [
                                                        SvgPicture.asset(
                                                            ImageAssets
                                                                .faceBookLogo),
                                                        AutoSizeText(
                                                          "FaceBook",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 28,
                                                              color: Colors
                                                                  .white,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      fixedSize:
                                                      Size(width / 5, 60),
                                                      primary: Colors.white,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            30.0),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                      children: [
                                                        SvgPicture.asset(
                                                            ImageAssets
                                                                .googleLogo),
                                                        AutoSizeText(
                                                          "Google",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 28,
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              divider(),
                                              SizedBox(
                                                height: height * .02,
                                              ),
                                              CustomTextFormField(
                                                controller: firstNameController,
                                                hitText: "First Name",
                                                fieldValidator:
                                                requireValidator,
                                              ),
                                              CustomTextFormField(
                                                controller: lastNameController,
                                                hitText: "Last Name",
                                                fieldValidator:
                                                requireValidator,
                                              ),
                                              CustomTextFormField(
                                                controller: emailController,
                                                hitText: "Email",
                                                fieldValidator:
                                                emailValidator,
                                              ),
                                              CustomTextFormField(
                                                controller: passController,
                                                hitText: "password",
                                                fieldValidator:
                                                passwordValidator,
                                                password: true,
                                              ),
                                              CustomTextFormField(
                                                controller: rePasswordController,
                                                hitText: "Re-Enter Password",
                                                password: true,

                                                fieldValidator:(val){
                                                  if(val.isEmpty) {
                                                    return 'Empty';
                                                  }
                                                  if(val != passController.text) {
                                                    return 'Not Match';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(vertical: 20),
                                              child: Container(
                                                decoration:
                                                 BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(32),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black38,
                                                      blurRadius: 15,
                                                      offset: Offset(0, 10),
                                                    ),
                                                  ],
                                                ),
                                                child:  Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                  child: DropdownButton(
                                                    isExpanded: true,
                                                    isDense: false,
                                                    underline: const SizedBox(),

                                                    // Initial Value
                                                    value: dropdownvalue,

                                                    // Down Arrow Icon
                                                    icon: const Icon(Icons.keyboard_arrow_down),

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
                                                        dropdownvalue = newValue.toString();
                                                      });
                                                    },
                                                  ),
                                                ), )),
                                              ElevatedButton(
                                                onPressed: () async{
                                                  if(_formKey.currentState!.validate()) {
                                                   await cubit.register(email: emailController.text,
                                                       password: passController.text,
                                                       firstName: firstNameController.text,
                                                       lastName: lastNameController.text,
                                                       county: dropdownvalue,
                                                       context: context);
                                                  }
                                                },
                                                style:
                                                ElevatedButton.styleFrom(
                                                  primary:
                                                  const Color(0xff492F24),
                                                  fixedSize:
                                                  Size(width / 2, 60),
                                                  shape:
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30.0),
                                                  ),
                                                ),
                                                child: AutoSizeText(
                                                  "Sign up ",
                                                  style: GoogleFonts.lato(
                                                      color: const Color(
                                                          0xffFFE3C5),
                                                      fontSize: AppSize.s28,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    15.0),
                                                child: TextButton(
                                                    onPressed: () {
                                                      GoRouter.of(context).go('/loginScreen');

                                                    },
                                                    child: Text(
                                                        "Already have an account? Login",
                                                        style: GoogleFonts.lato(
                                                            color: const Color(
                                                                0xff492F24),
                                                            fontSize: 10,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold))),
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                                Positioned(
                                left:-16,
                                top: -10
                                ,child: Align( alignment: Alignment.topLeft,child: SvgPicture.asset(ImageAssets.dogHand ,width: 40,))),
                                Positioned(
                                    right:-16,
                                    bottom: -10
                                    ,child: Align( alignment: Alignment.bottomRight,child: SvgPicture.asset(ImageAssets.dogHandDown ,width: 40,))),

                              ],
                            ),
                          ),
                        ),
                      ),
                      FooterSection(height: height, width: width)
                    ],
                  ),
                ),
              ),
            ));
  },
));
  }

  MouseRegion buildMouseRegion(BuildContext context, Widget widget) {
    Offset pointer = Offset(300, 300);

    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (eve) {
        setState(() {
          pointer = eve.position;
        });
        if (kDebugMode) {
          print(pointer.dx);
        }
        if (kDebugMode) {
          print(pointer.dy);
        }
      },
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 100),
        child: Stack(
          children: [
            widget,
            AnimatedPositioned(
              // Custom dot in Cursor
                duration: const Duration(milliseconds: 100),
                left: pointer.dx,
                top: pointer.dy - 70,
                child: Container(
                  width: 50,
                  color: Colors.transparent,
                  child: Image.asset(ImageAssets.cursor),
                )),
          ],
        ),
      ),
    );
  }
}

// Form(
// key: _key,
// child: SingleChildScrollView(
// child: Column(
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 25),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// SizedBox(
// height: MediaQuery.of(context).size.height * .05),
// Row(
// children: const [
// AutoSizeText(TextManager.welcome,
// style: TextStyle(
// fontSize: 32,
// fontWeight: FontWeight.w700)),
// AutoSizeText("Back!",
// style: TextStyle(
// fontSize: 32,
// fontWeight: FontWeight.w700,
// color: Color(0xFFFF6600))),
// ],
// ),
// const AutoSizeText(TextManager.login,
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w600,
// color: Color(0xFF3A3A3A))),
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.07,
// ),
// TextFormField(
// onChanged: (val) {
// email = val;
// },
// validator: emailValidator,
// decoration: InputDecoration(
// contentPadding:
// EdgeInsets.symmetric(vertical: h),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10)),
// prefixIcon: const SizedBox(),
// labelText: "Email",
// labelStyle: const TextStyle(
// fontSize: 13,
// fontWeight: FontWeight.bold,
// color: Color(0xFFB7B7B7)),
// hintText: "*****@***.com",
// hintStyle: const TextStyle(
// fontSize: 17,
// fontWeight: FontWeight.bold,
// color: Color(0xFFD0D0D0)),
// fillColor: const Color(0xFFEDEDED),
// filled: true),
// style: const TextStyle(
// fontSize: 15, fontWeight: FontWeight.bold),
// keyboardType: TextInputType.emailAddress,
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.05,
// ),
// TextFormField(
// onChanged: (val) {
// pass = val;
// },
// validator: (value) {
// if (value!.isEmpty) {
// return "Feild is Required";
// }
// return null;
// },
// decoration: InputDecoration(
// contentPadding: EdgeInsets.symmetric(
// vertical: h,
// ),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10)),
// prefixIcon: const SizedBox(),
// suffixIcon: IconButton(
// onPressed: () {
// setState(() {
// securePass = !securePass;
// });
// },
// icon: securePass
// ? const Icon(
// Icons.remove_red_eye_outlined,
// size: 20,
// color: Color(0xFFD0D0D0),
// )
//     : const FaIcon(
// FontAwesomeIcons.eyeSlash,
// size: 15,
// color: Color(0xFFD0D0D0),
// ),
// ),
// labelText: "Password",
// labelStyle: const TextStyle(
// fontSize: 13,
// fontWeight: FontWeight.bold,
// color: Color(0xFFB7B7B7)),
// hintText: "Enter your Password",
// hintStyle: const TextStyle(
// fontSize: 17,
// fontWeight: FontWeight.bold,
// color: Color(0xFFD0D0D0)),
// fillColor: const Color(0xFFEDEDED),
// filled: true),
// style: const TextStyle(
// fontSize: 15, fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// keyboardType: TextInputType.visiblePassword,
// obscureText: securePass,
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.01,
// ),
// Align(
// alignment: Alignment.topRight,
// child: TextButton(
// child: const Text(
// "Forget Password?",
// style: TextStyle(
// color: Color(0xFFFF6600),
// fontSize: 13,
// decoration: TextDecoration.underline,
// fontWeight: FontWeight.w400),
// ),
// onPressed: () {
// // Navigator.push(
// //     context,
// //     MaterialPageRoute(
// //         builder: (context) =>
// //             ForgesPassScreen()));
// }),
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height * .03),
// SizedBox(
// height: 50,
// child: ElevatedButton(
// onPressed: () async {
// if (_key.currentState!.validate()) {
// // setState(() {
// //   showSpinner = true;
// // });
// // api.email = email;
// // api.pass = pass;
// // await api.login();
// //
// // Fluttertoast.showToast(
// //   msg: api.message_reg,
// //   fontSize: 15,
// //   toastLength: Toast.LENGTH_SHORT,
// //   timeInSecForIosWeb: 10,
// // );
// // showSpinner = false;
// //
// // if (api.status_reg == true) {
// //   Navigator.pushAndRemoveUntil(
// //       context,
// //       MaterialPageRoute(
// //           builder: (BuildContext context) =>
// //               Nav_Home()),
// //       ModalRoute.withName('/'));
// // }
// // showSpinner = false;
// }
// },
// style: ElevatedButton.styleFrom(
// elevation: 15,
// primary: const Color(0xFFFF6600),
// // onPrimary: Colors.black,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10))),
// child: const Text(
// "Login",
// style: TextStyle(
// fontSize: 14, fontWeight: FontWeight.w700),
// ),
// ),
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.01,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// "Don't Have an Account?",
// style: TextStyle(
// fontSize: 13, fontWeight: FontWeight.bold),
// ),
// TextButton(
// onPressed: () {
// // Navigator.pushReplacement(
// //     context,
// //     MaterialPageRoute(
// //         builder: (context) => SignUpScreen()));
// },
// child: const Text(
// "Sign Up",
// style: TextStyle(
// fontSize: 13,
// color: Color(0xFFFF6600),
// fontWeight: FontWeight.w900),
// ))
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
