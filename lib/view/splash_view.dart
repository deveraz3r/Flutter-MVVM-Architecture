import 'dart:async';

import 'package:mvvm_example/utils/app_urls.dart';
import 'package:mvvm_example/view_model/services/splash_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Get.put(UserViewModel(), permanent: true);
    Get.put(MoviesViewModel(), permanent: true);
    // SharedPreferences.setMockInitialValues({'token' : 'xyz'});
    Timer(
      const Duration(seconds: 3),
      () => SplashService.checkUserAuthentication(context)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: const Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
