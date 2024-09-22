import 'package:mvvm_example/data/network/base_api_services.dart';
import 'package:mvvm_example/data/network/network_api_service.dart';
import 'package:mvvm_example/model/user_model.dart';
import 'package:mvvm_example/resources/app_end_points.dart';

class AuthRepository{
  BaseApiServices _apiService = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async{
    try{
      dynamic response =
        await _apiService.getPostApiResponse(AppEndPoints.loginEndPoint, data);
      return UserModel.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }

  Future<UserModel> registerApi(dynamic data) async{
    try{
      dynamic response =
        await _apiService.getPostApiResponse(AppEndPoints.registerEndPoint, data);
      return UserModel.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }

}