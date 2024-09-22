// import 'dart:ffi';
import 'package:mvvm_example/utils/app_urls.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  var _auth = Get.put(AuthViewModel());
  var _user = Get.put(UserViewModel());

  RxBool isObscured = true.obs;
  bool isLoading = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  AuthViewModel _authViewModel = Get.find();

  void login(BuildContext context){
    if(_passwordController.text.length < 6){
      Utils.flushBarErrorMessages("Password must atleast be 6 characters long", context);
    }
    else{
      Map data = {
        "email": _emailController.text.toString(),
        "password": _passwordController.text.toString()
      };
      _authViewModel.loginApi(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Log In",
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email)
              ),
              onSubmitted: (value){
                Utils.feildFocusChange(context, current: emailFocusNode, next: passwordFocusNode);
              },
            ),
            Obx(
              ()=> TextField(
                controller: _passwordController,
                focusNode: passwordFocusNode,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscured.value,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffix: IconButton(
                    icon: isObscured.value? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    onPressed: (){
                      isObscured.value = !isObscured.value;
                    },
                  )
                ),
                onSubmitted: (value){
                  login(context);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ReuseableElevatedbutton(
              onPressed: (){
                login(context);
              },
              buttonName: "Log In"
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Get.toNamed(RouteName.signup);
              },
              child: Text("Don't have an account? Signup"),
            ),
            SizedBox(height: 15,),
            Obx (
              () => _authViewModel.isLoading.value
              ? CircularProgressIndicator()
              : SizedBox()
            ),
          ],
        ),
      ),
    );
  }
}
