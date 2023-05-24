import 'package:flutter/material.dart';
import 'package:flutter_provider/models/register_model.dart';
import 'package:flutter_provider/presnetations/sign_in_screen.dart';
import 'package:flutter_provider/utils/enum.dart';
import 'package:flutter_provider/models/sign_in_model.dart';
import 'package:flutter_provider/presnetations/home_screen.dart';
import 'package:flutter_provider/presnetations/widgets/app_text_field.dart';
import 'package:flutter_provider/view_model/register_viewmodel.dart';
import 'package:flutter_provider/view_model/sign_in_viewmodel.dart';
import 'package:provider/provider.dart';

import '../utils/common_utils.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen() : super();


  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Future<void> _register() async{
      String name= nameController.text.trim();
      String phone= phoneController.text.trim();
      String email= emailController.text.trim();
      String password= passwordController.text.trim();
      RegisterBody registerBody = RegisterBody(name: name,phone:phone,email: email, password: password);
      var provider= Provider.of<RegisterViewModel>(context,listen: false);
      await provider.register(registerBody);
      if(provider.isBack ) {
        CommonUtil().showToast(provider.registerResponse.message ?? '');
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      }

    }
    return  Scaffold(
      body: Consumer<RegisterViewModel>(builder: (context,data,child) {
        return  data.loading  ?
        Center(child: CircularProgressIndicator(),
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Create an Account',
              style: TextStyle(
                  fontSize: 24),
            ), SizedBox(
              height: 20,
            ),
            AppTextField(
                textController: nameController,
                hintText: "Name",
                icon: Icons.email),
            SizedBox(
              height: 20,
            ),
            AppTextField(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.email),
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
                _register();
              },
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 23),
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: const Text(
                  "Register",
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

          ],
        );
      }),
    );
  }


}
