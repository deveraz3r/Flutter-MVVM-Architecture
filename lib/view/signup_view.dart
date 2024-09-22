// import 'dart:ffi';
import 'package:mvvm_example/utils/app_urls.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  RxBool isObscured = true.obs;
  bool isLoading = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _reEnterPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode reEnterPasswordFocusNode = FocusNode();

  AuthViewModel _authViewModel = Get.put(AuthViewModel());

  void signup(BuildContext context){
    if (_passwordController.text == _reEnterPasswordController.text){
      if(_passwordController.text.length < 6){
        Utils.flushBarErrorMessages("Password must atleast be 6 characters long", context);
      }
      else{
        Map data = {
          "email": _emailController.text.toString(),
          "password": _passwordController.text.toString()
        };
        _authViewModel.singupApi(data, context);
      }
    }
    else {
      Utils.flushBarErrorMessages("Passwords does not match", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Sign Up",
        centerTitle: true,
        enableBack: true,
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
                  Utils.feildFocusChange(context, current: passwordFocusNode, next: reEnterPasswordFocusNode);
                },
              ),
            ),
            Obx(
              ()=> TextField(
                controller: _reEnterPasswordController,
                focusNode: reEnterPasswordFocusNode,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscured.value,
                decoration: InputDecoration(
                    hintText: "Re-enter Password",
                    labelText: "Re-enter Password",
                    prefixIcon: Icon(Icons.lock),
                    suffix: IconButton(
                      icon: isObscured.value? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: (){
                        isObscured.value = !isObscured.value;
                      },
                    )
                ),
                onSubmitted: (value){
                  signup(context);
                },
              ),
            ),
            SizedBox(height: 10,),
            ReuseableElevatedbutton(
                onPressed: (){
                  signup(context);
                },
                buttonName: "Sign Up"
            ),
            SizedBox(height: 10,),
            // InkWell(
            //   onTap: (){
            //     Get.offNamed(RouteName.login);
            //   },
            //   child: Text("Already have an account? Login"),
            // ),
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
