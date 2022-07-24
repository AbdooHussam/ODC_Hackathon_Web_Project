// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:odc/controller/shared/bloc/cubit_forget_password/forget_password_cubit.dart';
// import 'package:odc/controller/shared/bloc/cubit_login/login_cubit.dart';
// import 'package:odc/model/course_model.dart';
// import '../../controller/shared/bloc/cubit_home_page/home_page_cubit.dart';
// import '../../controller/shared/bloc/cubit_onBoarding_screen/on_boarding_cubit.dart';
// import '../../controller/shared/bloc/cubit_regiser/register_cubit.dart';
// import '../../model/get_categories_id_Model.dart';
// import '../constant/getCacheData.dart';
// import '../screens/course_details.dart';
// import '../screens/forgetPassword/create_new_password.dart';
// import '../screens/forgetPassword/forget_password.dart';
// import '../screens/forgetPassword/verify_your_email.dart';
// import '../screens/homeScreen/categories.dart';
// import '../screens/homeScreen/layout/homeScreen.dart';
// import '../screens/homeScreen/see_all_courses.dart';
// import '../screens/homeScreen/specific _category.dart';
// import '../screens/login_screen.dart';
// import '../screens/register_screen.dart';
// import '../screens/onBoarding_screen.dart';
//
// class Routes {
//   static const String onBoardingRoute = "/onBoarding";
//   static const String loginRoute = "/LoginScreen";
//   static const String registerRoute = "/register";
//   static const String forgetPasswordRoute = "/forgetPassword";
//   static const String verifyYourEmailScreen = "/verifyYourEmailScreen";
//   static const String createNewPassword = "/createNewPassword";
//   static const String homeScreen = "/HomeScreen";
//   static const String seeAllPage = "/seeAll";
//   static const String specificCategory = '/SpecificCategory';
//   static const String seeAllCourses = '/seeAllCourses';
//   static const String couresdetails = '/coursedetails';
// }
//
// final HomePageCubit homePageCubit = HomePageCubit()
//   ..getAllCategory()
//   ..getAllCourses()
//   ..getProfileData(GetCacheData().token);
// final ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit();
// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.onBoardingRoute:
//         return MaterialPageRoute(builder: (context) => OnBoardingScreen());
//       case Routes.loginRoute:
//         return MaterialPageRoute(
//             builder: (context) => BlocProvider<LoginCubit>(
//                   create: (context) => LoginCubit(),
//                   child: LoginScreen(),
//                 ));
//       case Routes.registerRoute:
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider<RegisterCubit>(
//             create: (context) => RegisterCubit(),
//             child: RegisterScreen(),
//           ),
//         );
//       case Routes.forgetPasswordRoute:
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider<ForgetPasswordCubit>(
//             create: (context) => ForgetPasswordCubit(),
//             child: ForgetPassword(),
//           ),
//         );
//       case Routes.verifyYourEmailScreen:
//         final args = settings.arguments as Map;
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//   value: forgetPasswordCubit,
//   child: VerifyYourEmail(email: args['email']),
// ),
//         );
//       case Routes.createNewPassword:
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//   value: forgetPasswordCubit,
//   child: CreateNewPassword(),
// ),
//         );
//       case Routes.homeScreen:
//         return MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//                   value: homePageCubit,
//                   child: HomeScreen(),
//                 ));
//       case Routes.seeAllPage:
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: homePageCubit,
//             child: const seeAllPage(),
//           ),
//         );
//       case Routes.specificCategory:
//         final args = settings.arguments as GetCategoryId;
//         return MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//                   value: homePageCubit,
//                   child:   SpecificCategory(categoryId: args),
//                 ));
//       case Routes.seeAllCourses:
//         return MaterialPageRoute(
//             builder: (context) => BlocProvider.value(
//                   value: homePageCubit,
//                   child: const SeeAllCourses(),
//                 ));
//
//       case Routes.couresdetails:
//         return MaterialPageRoute(
//             settings: settings, builder:
//             (context) => BlocProvider.value(
//   value: homePageCubit,
//   child: CourseDetails(),
// ));
//
//       default:
//         return unDefinedRoute();
//     }
//   }
//
//   static Route unDefinedRoute() => MaterialPageRoute(
//       builder: (context) => Scaffold(
//             appBar: AppBar(
//                 // title: Text(AppString.undefinedRoute),
//                 ),
//             body: const Center(
//                 // child:Text(AppString.undefinedRoute),
//                 ),
//           ));
// }
