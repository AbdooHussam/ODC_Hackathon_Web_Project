import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:odc_hackathon_web_project/Authentication/View/widget/componats.dart';
import 'package:odc_hackathon_web_project/Authentication/auth_cubit.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/text_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';

import '../../core/constant/mouseRegion.dart';
import '../../core/constant/text_FormField.dart';
import '../../core/constant/validator.dart';
import '../../core/widgets/custom_text_button.dart';
import '../../core/widgets/footer_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int mainItemHover = 0;
  bool securePass = true;
  String name = "", email = "", pass = "", phone = "", address = "";
  bool showSpinner = false;
  final _key = GlobalKey<FormState>();
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                                    onPressed: () {
                                      GoRouter.of(context).go('/Register');
                                    },
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
                                    onPressed: () {},
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
                            padding: const EdgeInsets.only(top: 50 ),
                            child: SizedBox(
                              height: height * 1.3,
                              width: double.infinity,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [









                                  Positioned(
                                    top: -18,
                                    right: 650,
                                    child: SvgPicture.asset(
                                      ImageAssets.dogLoginScreen,
                                      width: AppSize.s250,
                                    ),
                                  ),
                                  Positioned(
                                    top: -660,
                                    right: 20,
                                    child: SizedBox(
                                      width: width,
                                      height: height * 2,
                                      child: ParallaxStack(
                                        useLocalPosition: true,
                                        layers: [
                                          ParallaxLayer(
                                            offset: Offset(-18, 20),
                                            yRotation: 0.2,
                                            xRotation: 0.1,
                                            yOffset: 9,
                                            xOffset: 9,
                                            child: Center(
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(200),
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ParallaxLayer(
                                            offset: const Offset(49, 10),
                                            yRotation: 0.1,
                                            xRotation: 0.1,
                                            yOffset: 9,
                                            xOffset: 9,
                                            child: Center(
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(200),
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      height: height * 0.8,
                                      width: width * 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 2),
                                          borderRadius: BorderRadius.circular(30)),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * .02,
                                          ),
                                          AutoSizeText(
                                            TextManager.login,
                                            style: GoogleFonts.lato(
                                                fontSize: AppSize.s40),
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
                                                    ElevatedButton(
                                                      onPressed: () async
                                                      {
                                                        if(_formKey.currentState!.validate()){
                                                          await cubit.login(
                                                              email: emailController.text,
                                                              password: passController.text,
                                                              context: context
                                                          );
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
                                                        "Sign In ",
                                                        style: GoogleFonts.lato(
                                                            color: const Color(
                                                                0xffFFE3C5),
                                                            fontSize: AppSize.s28,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    ),
                                                    Align(
                                                        alignment:
                                                        Alignment.topRight,
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          child: AutoSizeText(
                                                            "Forget Password?",
                                                            style: GoogleFonts.lato(
                                                                color: const Color(
                                                                    0xff492F24),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: height * .02,
                                                    ),
                                                    divider(),
                                                    SizedBox(
                                                      height: height * .02,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () async{
                                                            await   cubit.loginFaceBook(context: context);


                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                            const Color(0xff2F4582),
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
                                                          onPressed: ()async {
                                                            await cubit.loginGoogle(context: context);
                                                          },
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
                                                    Padding(
                                                      padding: const EdgeInsets.all(
                                                          15.0),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            GoRouter.of(context).go('/Register');
                                                          },
                                                          child: Text(
                                                              "Don`t have account ? SignUp",
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
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                          FooterSection(height: height,width: width,)

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
// hintText: "**@**.com",
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
