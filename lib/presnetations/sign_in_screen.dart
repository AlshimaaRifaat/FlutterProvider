import 'package:flutter/material.dart';
import 'package:flutter_provider/presnetations/register_screen.dart';
import 'package:flutter_provider/utils/common_utils.dart';
import 'package:flutter_provider/utils/enum.dart';
import 'package:flutter_provider/models/sign_in_model.dart';
import 'package:flutter_provider/presnetations/home_screen.dart';
import 'package:flutter_provider/presnetations/widgets/app_text_field.dart';
import 'package:flutter_provider/view_model/sign_in_viewmodel.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
   const SignInScreen() : super();


  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Future<void> _signIn() async{
      String email= emailController.text.trim();
      String password= passwordController.text.trim();
      SignInBody signInBody = SignInBody(email: email, password: password);
     var provider= Provider.of<SignInViewModel>(context,listen: false);
     await provider.signIn(signInBody);
     if(provider.isBack ) {
       CommonUtil().showErrorToast(provider.signInResponse.message ?? '');
       Navigator.push(context,
         MaterialPageRoute(builder: (context) => HomeScreen()),
       );
     }
    }
    return  Scaffold(
      body: Consumer<SignInViewModel>(builder: (context,data,child) {
       return  data.loading  ?
           Center(child: CircularProgressIndicator(),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login',
                style: TextStyle(
                    fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                  textController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                  textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  _signIn();
                },
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 23),
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.brown[300],
                    borderRadius: BorderRadius.circular(15),

                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const Text('Don\'t have an account? , click here to create one',
                    style: TextStyle(
                        fontSize: 20),
                  ),
                ),
              ),

            ],
          );
      }),
    );
  }


}
