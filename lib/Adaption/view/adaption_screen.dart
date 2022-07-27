import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_hackathon_web_project/Adaption/controller/adaption_cubit.dart';
import 'package:odc_hackathon_web_project/core/widgets/footer_section.dart';
import '../../core/constant/mouseRegion.dart';
import '../../core/resource/assets_manager.dart';
import '../../core/resource/text_manager.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_button.dart';
class AdaptionScreen extends StatefulWidget {
  const AdaptionScreen({Key? key}) : super(key: key);

  @override
  State<AdaptionScreen> createState() => _AdaptionScreenState();
}

class _AdaptionScreenState extends State<AdaptionScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Mouse( widget: ListView(
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
            width: double.infinity,
            height: height*.5,
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image(image: AssetImage(ImageAssets.dogsFeed ),width: width*0.3,),
                  Image(image: AssetImage(ImageAssets.dishDog ),width: width*0.1,)
                ],
              ),
            ),
          ),
          BlocConsumer<AdaptionCubit, AdaptionState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = AdaptionCubit.get(context);
              return (cubit.title != null &&cubit.body !=null)? SizedBox(
                width:width,

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(cubit.title.toString() , style: GoogleFonts.lato(fontWeight: FontWeight.bold ,
                            fontSize: 31,
                            color: Color(0xff492F24)
                        ),),
                      ),
                      SizedBox(height: height*.05,),
                      AutoSizeText(cubit.body.toString() ,style: GoogleFonts.lato(fontWeight: FontWeight.w600 ,
                          fontSize: 20,
                          color: Color(0xff492F24)),),

                    ],
                  ),
                ),
              ):CircularProgressIndicator();
            },
          ),
          FooterSection(height: height, width: width)
        ],
      )),
    );
  }
}
