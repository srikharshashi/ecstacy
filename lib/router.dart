import 'package:bloc_custom_firebase/constants.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register_pages/number_reg.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register_pages/location_reg.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register_pages/age_reg.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register_pages/image_reg.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register_pages/invite_reg.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register_pages/user_reg.dart';
import 'package:bloc_custom_firebase/ui/screens/home/HomePage.dart';
import 'package:bloc_custom_firebase/ui/screens/google_register/register_pages/name_reg.dart';
import 'package:bloc_custom_firebase/ui/screens/front_page.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question1.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question3.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question5.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question5.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question2.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question21.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question4.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question41.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question6.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/question_home.dart';
import 'package:bloc_custom_firebase/ui/screens/questions/questions_comp.dart';
import 'package:bloc_custom_firebase/ui/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'ui/screens/google_register/register_pages/gender_reg.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SPLASH_SCREEN_ROUTE:
        return PageTransition(
            child: SplashScreen(), type: PageTransitionType.rightToLeft);
      case FRONT_PAGE:
        return PageTransition(
            child: FrontPage(), type: PageTransitionType.rightToLeft);
      case HOME_ROUTE:
        return PageTransition(
            child: Home(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE1:
        return PageTransition(
            child: Reg1(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE2:
        return PageTransition(
            child: Reg2(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE3:
        return PageTransition(
            child: Reg3(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE4:
        return PageTransition(
            child: Reg4(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE5:
        return PageTransition(
            child: Reg5(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE6:
        return PageTransition(
            child: Reg6(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE7:
        return PageTransition(
            child: Reg7(), type: PageTransitionType.rightToLeft);
      case REGISTER_PAGE8:
        return PageTransition(
            child: Reg8(), type: PageTransitionType.rightToLeft);
      case QUESTIONS_HOME:
        return PageTransition(
            child: Questions(), type: PageTransitionType.rightToLeft);
      case QUESTION1:
        return PageTransition(
            child: Question1(), type: PageTransitionType.rightToLeft);
      case QUESTION2:
        return PageTransition(
            child: Question2(), type: PageTransitionType.rightToLeft);
      case QUESTION21:
        return PageTransition(
            child: Question21(), type: PageTransitionType.rightToLeft);
      case QUESTION3:
        return PageTransition(
            child: Question3(), type: PageTransitionType.rightToLeft);
      case QUESTION4:
        return PageTransition(
            child: Question4(), type: PageTransitionType.rightToLeft);
      case QUESTION5:
        return PageTransition(
            child: Question5(), type: PageTransitionType.rightToLeft);
      case QUESTION6:
        return PageTransition(
            child: Question6(), type: PageTransitionType.rightToLeft);
      case QUESTION41:
        return PageTransition(
            child: Question41(), type: PageTransitionType.rightToLeft);
      case QUESTIONS_COMP:
        return PageTransition(
            child: Questions_Completed(), type: PageTransitionType.rightToLeft);
      default:
        return null;
    }
  }
}
