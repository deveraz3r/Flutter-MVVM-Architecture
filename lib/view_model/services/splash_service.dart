import 'package:flutter/foundation.dart';
import 'package:mvvm_example/utils/app_urls.dart';
import 'package:mvvm_example/view_model/user_view_model.dart';

class SplashService {
  static checkUserAuthentication(BuildContext context){
    Get.find<UserViewModel>().getUser().then((value){
      print(value.token);
      if(value.token == "null" || value.token == ""){
        Get.offNamed(RouteName.login);
      }
      else{
        Get.find<MoviesViewModel>().getMoviesList();
        Get.offNamed(RouteName.home);
      }
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessages(error.toString(), context);
    });
  }
}