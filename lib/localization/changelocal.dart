import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../services/services.dart';

class LocaleController extends GetxController{
  Locale?language;
  MyServices myServices = Get.find();
  changeLang(String langcode){
    Locale  locale=Locale(langcode);
    myServices.sharedPreferences.setString("lang",langcode);
    Get.updateLocale(locale);
  }
  @override
  void onInit(){
    String?sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang =="ar") {
      language = const Locale("ar");
    }else if (sharedPrefLang=="en"){
      language=const Locale("en");
    }else{
      language =Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

}