import 'package:fertie_application/model/language_model.dart';

class AppConstants{
  static String APP_NAME = "Car Rental";
  static String isLogged = "IsLogged";
  static String google_api_key = "AIzaSyBUKgC5i0rzRLbGhndTjM0b6QdWbigR6_E";


  // Share preference Key
  static String THEME ="theme";
  static const String LANGUAGE_CODE = 'language_code';
  static const String COUNTRY_CODE = 'country_code';
  static RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passwordValidator = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
  );
  static List<LanguageModel> languages = [
    LanguageModel( languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(languageName: 'French', countryCode: 'FR', languageCode: 'fr'),
    LanguageModel(languageName: 'Arabic', countryCode: 'AE', languageCode: 'ar'),
  ];


//=================>> App Data from User fpr Car Rental App <<=============================
  static const String bearerToken = "BearerToken";
  static String role = "Role";
  static String userId = "userId";
  static String fcmToken = "fcmToken";
}


enum Status { loading, completed, error, internetError }
enum Role {user, driver, agency}
