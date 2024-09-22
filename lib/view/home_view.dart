import 'package:mvvm_example/utils/app_urls.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MoviesViewModel _movies = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Home",
        centerTitle: true,
        actions: [
          ReuseableElevatedbutton(
            width: 65,
            margin: const EdgeInsets.all(10),
            color: AppColors.redColor,
            buttonName: "Logout",
            onPressed: (){
              UserViewModel.removeUser();
              Get.offNamed(RouteName.login);
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReuseableElevatedbutton(
              margin: const EdgeInsets.symmetric(vertical: 10),
              buttonName: "load Data",
              onPressed: (){
                _movies.getMoviesList();
              },
            ),
            Expanded(
              child: Obx(
                 () {
                   switch (_movies.moviesList.value.status) {
                     case Status.LOADING:
                       return const Center(child: CircularProgressIndicator());
                     case Status.COMPLETED:
                       return ListView.builder(
                         itemCount: _movies.moviesList.value.data!.movies!.length,
                         itemBuilder: (context, index){
                           return Card(
                             child: ListTile(
                               leading: Image.network(
                                 _movies.moviesList.value.data!.movies![index].posterurl.toString()
                               ),
                               title: Text(_movies.moviesList.value.data!.movies![index].title.toString(),),
                             ),
                           );
                         },
                       );
                     default:
                       return Center(
                         child: Text(
                           _movies.moviesList.value.message.toString(),
                           style:  const TextStyle(
                             color: Colors.red,
                             fontSize: 16
                           ),
                           textAlign: TextAlign.center,
                         ),
                       );
                    }
                 }
               ),
            )
          ],
        ),
      ),
    );
  }
}
