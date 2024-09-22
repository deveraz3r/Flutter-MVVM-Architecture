import 'package:mvvm_example/data/response/api_response.dart';
import 'package:mvvm_example/repository/movies_repository.dart';
import 'package:mvvm_example/utils/app_urls.dart';
import 'package:mvvm_example/model/movies_list_model.dart';
import 'package:get/get.dart';

class MoviesViewModel extends GetxController {
  final MoviesRepository _moviesRepository = MoviesRepository();

  // Making the moviesList observable
  var moviesList = ApiResponse<MoviesListModel>().obs;

  Future<void> getMoviesList() async {
    moviesList.value = ApiResponse.loading();
    _moviesRepository.getMoviesList().then((value) {
      moviesList.value = ApiResponse.completed(value);
    }).onError((error, stackTrace) {
      moviesList.value = ApiResponse.error(error.toString());
    });
  }
}
