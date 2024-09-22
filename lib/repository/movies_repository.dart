import 'package:mvvm_example/model/movies_list_model.dart';
import 'package:mvvm_example/utils/app_urls.dart';

class MoviesRepository {
  BaseApiServices _baseApiServices = NetworkApiService();

  Future<MoviesListModel> getMoviesList() async{
    try{
      dynamic response =
          await _baseApiServices.getGetApiResponse(AppEndPoints.moviesList);
      return MoviesListModel.fromJson(response);
    }
    catch (e){
      throw e;
    }
  }

}