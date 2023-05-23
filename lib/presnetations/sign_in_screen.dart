import 'package:flutter/material.dart';
import 'package:flutter_provider/presnetations/widgets/app_text_field.dart';

class SignInScreen extends StatelessWidget {
   const SignInScreen() : super();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return  Scaffold(
      body: Column(
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
         Container(
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

        ],
      ),
    );
  }
}
