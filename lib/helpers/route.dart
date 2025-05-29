import 'package:fertie_application/onboarding_screen.dart';
import 'package:fertie_application/splash_screen.dart';
import 'package:fertie_application/views/screen/auth/code_verifyEmailScreen.dart';
import 'package:fertie_application/views/screen/auth/email_verificationScreen.dart';
import 'package:fertie_application/views/screen/auth/forgetPassword.dart';
import 'package:fertie_application/views/screen/auth/resetPassword_screen.dart';
import 'package:fertie_application/views/screen/auth/setPasswordScreen.dart';
import 'package:fertie_application/views/screen/auth/signInScreen.dart';
import 'package:fertie_application/views/screen/auth/signUpScreen.dart';
import 'package:fertie_application/views/screen/home/insights/insight_screen.dart';
import 'package:fertie_application/views/screen/cycle_insights/cycle_insights_screen.dart';
import 'package:fertie_application/views/screen/home/inbox/individual_chat_screen.dart';
import 'package:fertie_application/views/screen/home/insights/editInsights_screen.dart';
import 'package:fertie_application/views/screen/home/homeScreen.dart';
import 'package:fertie_application/views/screen/notification/notificationScreen.dart';
import 'package:fertie_application/views/screen/personalize/menstrualCycleScreen.dart';
import 'package:fertie_application/views/screen/personalize/personalize_question_screen_five.dart';
import 'package:fertie_application/views/screen/personalize/personalize_question_screen_one.dart';
import 'package:fertie_application/views/screen/personalize/personalize_question_screen_three.dart';
import 'package:fertie_application/views/screen/personalize/personalize_question_screen_two.dart';
import 'package:fertie_application/views/screen/personalize/personalize_screen.dart';
import 'package:fertie_application/views/screen/profile/accessPin/confirm_accessPin_screen.dart';
import 'package:fertie_application/views/screen/profile/accessPin/new_accessPin_screen.dart';
import 'package:fertie_application/views/screen/profile/accessPin/old_accessPin_screen.dart';
import 'package:fertie_application/views/screen/profile/accessPin/remove_accesspin_screen.dart';
import 'package:fertie_application/views/screen/profile/accessPin/set_access_pin_screen.dart';
import 'package:fertie_application/views/screen/profile/editPersonalInforamtion.dart';
import 'package:fertie_application/views/screen/profile/help/helpScreen.dart';
import 'package:fertie_application/views/screen/profile/lapTest/labDetsils_screen.dart';
import 'package:fertie_application/views/screen/profile/personalInformationScreen.dart';
import 'package:fertie_application/views/screen/profile/profile_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../views/screen/personalize/periodLengthScreen.dart';
import '../views/screen/personalize/personalize_question_screen_four.dart';
import '../views/screen/profile/lapTest/labTestScreen.dart';
import '../views/screen/profile/upgradeAccount/upgradeAccountScreen.dart';

class AppRoutes{
  static String splashScreen = "/splash_screen";
  static String onboardingScreen = "/Onboarding_screen";
  static String signUpScreen = "/signUpScreen";
  static String homeScreen = "/homeScreen";
  static String signInScreen = "/signInScreen";


  static String profileScreen = "/profileScreen";
  static String notificationScreen = "/notificationScreen";
  static String setPasswordScreen = "/setPasswordScreen";
  static String emailVerificationScreen = "/emailVerificationScreen";
  static String codeVerifyEmailScreen = "/CodeVerifyEmailScreen";
  static String forgetPasswordScreen = "/forgetPasswordScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";
  static String personalInformationScreen = "/personalInformationScreen";
  static String editPersonalInformationScreen = "/editPersonalInformationScreen";
  static String setAccessPinScreen = "/setAccessPinScreen";
  static String removeAccessPinScreen = "/removeAccessPinScreen";
  static String helpScreen = "/help_screen";
  static String confirmAccessPinScreen = "/confirmAccessPinScreen";
  static String newAccessPinScreen = "/newAccessPinScreen";
  static String oldAccessPinScreen = "/oldAccessPinScreen";
  static String personalizeScreen = "/personalizeScreen";
  static String personalizeQuestionScreenOne = "/personalizeQuestion_screen_one";
  static String personalizeQuestionScreenTwo = "/personalizeQuestion_screen_two";
  static String personalizeQuestionScreenThree = "/personalizeQuestionScreenThree";
  static String personalizeQuestionScreenFour = "/PersonalizeQuestionScreenFour";
  static String personalizeQuestionScreenFive = "/personalizeQuestionScreenFive";
  static String periodLengthScreen = "/periodLengthScreen";
  static String menstrualCycleScreen = "/menstrualCycleScreen";
  static String editCycleInsightScreen = "/editCycleInsightScreen";
  static String labTestScreen = "/labTestScreen";
  static String labDetailsScreen = "/labDetailsScreen";
  static String upgradeAccountScreen = "/upgrade_account_screen";
  static String editInsightsScreen = "/editInsightsScreen";
  static String cycleInsightsScreen = "/cycleInsightsScreen";
  static String individualChatIScreen = "/individualChatIScreen";
  static String insightScreen = "/insightScreen";





 static List<GetPage> page=[

   //SplashScreen
   GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   // GetPage(name:splashScreen, page: ()=>const SplashScreen(),transition: Transition.noTransition),
   GetPage(name:onboardingScreen, page: ()=> OnboardingScreen(),transition: Transition.noTransition),

   //Auth
   GetPage(name:signUpScreen, page: ()=> SignUpScreen(),transition: Transition.noTransition),
   GetPage(name:signInScreen, page: ()=> SignInScreen(),transition: Transition.noTransition),
   GetPage(name:setPasswordScreen, page: ()=> SetPasswordScreen(),transition: Transition.noTransition),
   GetPage(name:emailVerificationScreen, page: ()=> EmailVerificationScreen(),transition: Transition.noTransition),
   GetPage(name:codeVerifyEmailScreen, page: ()=> CodeVerifyEmailScreen(),transition: Transition.noTransition),
   GetPage(name:forgetPasswordScreen, page: ()=> ForgetPasswordScreen(),transition: Transition.noTransition),
   GetPage(name:resetPasswordScreen, page: ()=> ResetPasswordScreen(),transition: Transition.noTransition),

   //Home
   GetPage(name:homeScreen, page: ()=> HomeScreen(),transition: Transition.noTransition),
   GetPage(name:editInsightsScreen, page: ()=> EditInsightsScreen(),transition: Transition.noTransition),

   //CycleInsight

   GetPage(name:insightScreen, page: ()=> InsightsScreen(),transition: Transition.noTransition),
   GetPage(name:cycleInsightsScreen, page: ()=> CycleInsightsScreen(),transition: Transition.noTransition),

   //Profile
   GetPage(name:profileScreen, page: ()=> ProfileScreen(),transition: Transition.noTransition),
   GetPage(name:personalInformationScreen, page: ()=> PersonalInformationScreen(),transition: Transition.noTransition),
   GetPage(name:editPersonalInformationScreen, page: ()=> EditPersonalInformationScreen(),transition: Transition.noTransition),
   GetPage(name:setAccessPinScreen, page: ()=> SetAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:removeAccessPinScreen, page: ()=> RemoveAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:helpScreen, page: ()=> HelpScreen(),transition: Transition.noTransition),
   GetPage(name:labTestScreen, page: ()=> LabTestScreen(),transition: Transition.noTransition),
   GetPage(name:labDetailsScreen, page: ()=> LabDetailsScreen(),transition: Transition.noTransition),
   GetPage(name:upgradeAccountScreen, page: ()=> UpgradeAccountScreen(),transition: Transition.noTransition),



   /// Profile >> Access Pin
   GetPage(name:confirmAccessPinScreen, page: ()=> ConfirmAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:newAccessPinScreen, page: ()=> NewAccessPinScreen(),transition: Transition.noTransition),
   GetPage(name:oldAccessPinScreen, page: ()=> OldAccessPinScreen(),transition: Transition.noTransition),


   //Personalize Screen
   GetPage(name: personalizeScreen, page: ()=> PersonalizeScreen(),transition: Transition.noTransition),
   GetPage(name: personalizeQuestionScreenOne, page: ()=> PersonalizeQuestionScreenOne(),transition: Transition.noTransition),
   GetPage(name: personalizeQuestionScreenTwo, page: ()=> PersonalizeQuestionScreenTwo(),transition: Transition.noTransition),
   GetPage(name: personalizeQuestionScreenThree, page: ()=> PersonalizeQuestionScreenThree(),transition: Transition.noTransition),
   GetPage(name: personalizeQuestionScreenFour, page: ()=> PersonalizeQuestionScreenFour(),transition: Transition.noTransition),
   GetPage(name: personalizeQuestionScreenFive, page: ()=> PersonalizeQuestionScreenFive(),transition: Transition.noTransition),
   GetPage(name: periodLengthScreen, page: ()=> PeriodLengthScreen(),transition: Transition.noTransition),
   GetPage(name: menstrualCycleScreen, page: ()=> MenstrualCycleScreen(),transition: Transition.noTransition),

   //Notification
   GetPage(name:notificationScreen, page: ()=> NotificationScreen(),transition: Transition.noTransition),
   GetPage(name:individualChatIScreen, page: ()=> IndividualChatIScreen(),transition: Transition.noTransition),


  ];
}