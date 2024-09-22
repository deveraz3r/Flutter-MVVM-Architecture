import 'package:get/get.dart';
import 'package:mvvm_example/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends GetxController{
  late RxBool isLoggedin;

  Future<bool> saveUser(UserModel user) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    return UserModel(
      token: token.toString()
    );
  }

  static Future<bool> removeUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }

}