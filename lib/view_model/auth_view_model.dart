import 'package:mvvm_example/utils/app_urls.dart';

class AuthViewModel extends GetxController{

  AuthRepository _authRepository = AuthRepository();
  RxBool isLoading = false.obs;

  Future<void> loginApi(dynamic data, BuildContext context) async{
    isLoading.value = true;

    await _authRepository.loginApi(data).then((value) {
      Get.find<UserViewModel>().saveUser(value); //save user session for future
      Utils.flushBarErrorMessages("Login Successful", context);
      Get.offAllNamed(RouteName.home);
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessages(error.toString(), context); //display error message
    });

    isLoading.value = false;
  }

  Future<void> singupApi(dynamic data, BuildContext context) async{
    isLoading.value = true;

    await _authRepository.registerApi(data).then((value) {
      Get.find<UserViewModel>().saveUser(value); //save user session for future
      Utils.flushBarErrorMessages("Signup Successful", context);
      Get.offNamed(RouteName.home);
    }).onError((error, stackTrace){
      Utils.flushBarErrorMessages(error.toString(), context);
    });

    isLoading.value = false;
  }

}