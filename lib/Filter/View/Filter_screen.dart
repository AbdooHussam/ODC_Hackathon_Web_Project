import 'dart:convert';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:odc_hackathon_web_project/Filter/View/ui/all_animal_filter_card.dart';
import 'package:odc_hackathon_web_project/Home/Controller/home1_cubit.dart';
import 'package:odc_hackathon_web_project/Home/View/ui/all_animal_cards.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/color_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/text_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';
import 'package:odc_hackathon_web_project/core/widgets/on_hover_button.dart';
import 'package:provider/provider.dart';
import '../../Authentication/View/widget/componats.dart';
import '../../Home/View/Request_screen.dart';
import '../../core/constant/mouseRegion.dart';
import '../../core/constant/text_FormField.dart';
import '../../core/constant/validator.dart';
import '../../core/resource/size_config.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_button.dart';
import '../../core/widgets/footer_section.dart';
import '../Controller/filter_cubit.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var genderItems = ["Gender", "male", "female"];
  String genderValue = 'Gender';

  TextEditingController breedController = TextEditingController();
  TextEditingController careBehaviorController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    var home = Home1Cubit.get(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => FilterCubit()
          ..getFilterControlModel(categoryId: widget.categoryId)
          ..getAllPetsFilterCategory(categoryId: widget.categoryId.toString()),
        child: BlocConsumer<FilterCubit, FilterState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var bloc = FilterCubit.get(context);
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/backHelp.png'),
                fit: BoxFit.fill,
              )),
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
                                      color: Colors.grey,
                                    ),
                                    function: () {
                                      Navigator.pop(context);
                                      print("AboutUs ssss");
                                    }),
                                CustomTextButton(
                                    text: "Adaption",
                                    textStyle: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    function: () {
                                      print("Adaption");
                                    }),
                                CustomTextButton(
                                    text: TextManager.services,
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    function: () {
                                      print("services");
                                    }),
                                CustomTextButton(
                                    text: TextManager.request,
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    function: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RequestScreen()));
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
                  SizedBox(
                    height: height * .05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              isDense: false,
                              underline: const SizedBox(),

                              // Initial Value
                              value: bloc.breedValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items:
                                  bloc.filterControl.breed!.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  bloc.breedValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * .06),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              isDense: false,
                              underline: const SizedBox(),

                              // Initial Value
                              value: bloc.ageValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items:
                                  bloc.filterControl.ages!.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  bloc.ageValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * .06),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              isDense: false,
                              underline: const SizedBox(),

                              // Initial Value
                              value: bloc.sizeValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items:
                                  bloc.filterControl.size!.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  bloc.sizeValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * .06),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              isDense: false,
                              underline: const SizedBox(),

                              // Initial Value
                              value: genderValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: genderItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  genderValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              isDense: false,
                              underline: const SizedBox(),

                              // Initial Value
                              value: bloc.colorValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: bloc.filterControl.colors!
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  bloc.colorValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * .06),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              isDense: false,
                              underline: const SizedBox(),

                              // Initial Value
                              value: bloc.hairLenghtValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: bloc.filterControl.hairLength!
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  bloc.hairLenghtValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * .06),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              isExpanded: true,
                              isDense: false,
                              underline: const SizedBox(),

                              // Initial Value
                              value: bloc.behaviourValue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: bloc.filterControl.behaviour!
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (newValue) {
                                setState(() {
                                  bloc.behaviourValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * .05),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          height: height * .08,
                          child: ElevatedButton(
                            onPressed: () async {
                              String? age2;
                              String? size2;
                              String? breed2;
                              String? gender2;
                              String? hairLength2;
                              String? color2;
                              String? careBehavior2;

                              if (bloc.ageValue == "Age" &&
                                  bloc.breedValue == "Breed" &&
                                  bloc.sizeValue == "Size" &&
                                  bloc.colorValue == "Color" &&
                                  bloc.hairLenghtValue == "Hair Lenght" &&
                                  bloc.behaviourValue == "Care & behavior" &&
                                  genderValue == "Gender") {
                                bloc.allPetsCategoryFilterList.clear();
                                bloc.getAllPetsFilterCategory(
                                    categoryId: widget.categoryId.toString());
                                Fluttertoast.showToast(
                                    msg: "No filter selected",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.red,
                                    webBgColor: "#F44336FF",
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                if (bloc.ageValue == "Age") {
                                  age2 = null;
                                } else {
                                  age2 = bloc.ageValue!;
                                }
                                if (bloc.sizeValue == "Size") {
                                  size2 = null;
                                } else {
                                  size2 = bloc.sizeValue!;
                                }
                                if (bloc.breedValue == "Breed") {
                                  breed2 = null;
                                } else {
                                  breed2 = bloc.breedValue;
                                }
                                if (genderValue == "Gender") {
                                  gender2 = null;
                                } else {
                                  genderValue == "male"
                                      ? gender2 = "true"
                                      : gender2 = "false";
                                }
                                if (bloc.hairLenghtValue == "Hair Lenght") {
                                  hairLength2 = null;
                                } else {
                                  hairLength2 = bloc.hairLenghtValue;
                                }
                                if (bloc.colorValue == "Color") {
                                  color2 = null;
                                } else {
                                  color2 = bloc.colorValue;
                                }
                                if (bloc.behaviourValue == "Care & behavior") {
                                  careBehavior2 = null;
                                } else {
                                  careBehavior2 = bloc.behaviourValue;
                                }
                                bloc.allPetsCategoryFilterList.clear();
                                bloc.getAllPetsFilterCategory(
                                    gender: gender2,
                                    breed: breed2,
                                    size: size2,
                                    color: color2,
                                    careBehavior: careBehavior2,
                                    hairLength: hairLength2,
                                    categoryId: widget.categoryId.toString());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff492F24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: AutoSizeText(
                              "Filter",
                              style: GoogleFonts.lato(
                                  color: const Color(0xffFFE3C5),
                                  fontSize: AppSize.s28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  (bloc.allPetsCategoryFilterList.isEmpty)
                      ? Center(
                          child: Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: height * .18),
                              child: const AutoSizeText(
                                "No Result",
                                style: TextStyle(
                                    fontSize: 100, fontWeight: FontWeight.bold),
                              )))
                      : Expanded(
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 3,
                            itemCount: bloc.allPetsCategoryFilterList.length,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 16,
                            itemBuilder: (context, index) {
                              return AllAnimalFilterCards(
                                  bloc.allPetsCategoryFilterList[index], home);
                            },
                            staggeredTileBuilder: (index) =>
                                const StaggeredTile.fit(1),
                          ),
                        ),
                  FooterSection(height: height, width: width),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
