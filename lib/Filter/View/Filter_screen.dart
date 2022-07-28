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
  var categoryItems = ["Category", "Dog", "Cat"];
  var yearItems = ["Year", "1", "2", "3", "4", "5", "6", "7"];
  var monthItems = [
    "Months",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11"
  ];
  var sizeItems = ["Size", "small", "medium", "large"];
  var hairLenghtItems = ["Hair Lenght", "short", "medium", "tall"];
  var houseTraindItems = ["House Traind", "yes", "no"];
  var genderItems = ["Gender", "male", "female"];
  String categoryValue = 'Category';
  String yearValue = 'Year';
  String monthValue = 'Months';
  String sizeValue = 'Size';
  String hairLenghtValue = 'Hair Lenght';
  String houseTraindValue = 'House Traind';
  String genderValue = 'Gender';

  TextEditingController breedController = TextEditingController();
  TextEditingController careBehaviorController = TextEditingController();
  TextEditingController colorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height -
        MediaQuery
            .of(context)
            .padding
            .top -
        kToolbarHeight;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        FilterCubit()
          ..getAllPetsFilter(categoryId: widget.categoryId),
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .05,
                          ),
                          CustomButton(
                            text: TextManager.signUp,
                            function: () {},
                            inColor: Colors.transparent,
                            outColor: const Color(0xffFFE3C5),
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .05,
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
                  (bloc.allPetsCategoryFilterList.isEmpty)
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 3,
                      itemCount: bloc.allPetsCategoryFilterList.length,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return AllAnimalFilterCards(
                            bloc.allPetsCategoryFilterList[index]);
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
