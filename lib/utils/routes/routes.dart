import 'package:mvvm_example/utils/app_urls.dart';

class Routes {

  // static Route<dynamic> generateRoute(RouteSettings settings){
  //   switch(settings.name){
  //     case RouteName.home:
  //       return MaterialPageRoute(builder: (BuildContext contex) => HomeScreen());
  //
  //     case RouteName.login:
  //       return MaterialPageRoute(builder: (BuildContext contex) => LoginView());
  //
  //     case RouteName.signup:
  //       return MaterialPageRoute(builder: (BuildContext contex) => SignupView());
  //
  //     case RouteName.splash:
  //       return MaterialPageRoute(builder: (BuildContext contex) => SplashView());
  //
  //     default:
  //       return MaterialPageRoute(builder: (_){
  //         return Scaffold(
  //           body: Center(
  //             child: Text("No route defined"),
  //           ),
  //         );
  //       });
  //   }
  // }

  //GetX
  static appRoutes() => [
    GetPage(name: RouteName.splash, page: () => SplashView()),
    GetPage(name: RouteName.home, page: () => HomeScreen()),
    GetPage(name: RouteName.login, page: () => LoginView()),
    GetPage(name: RouteName.signup, page: () => SignupView()),
  ];

}