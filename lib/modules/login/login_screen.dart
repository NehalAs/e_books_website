import 'package:e_books_website/modules/home/home_screen.dart';
import 'package:e_books_website/modules/register/register_screen.dart';
import 'package:e_books_website/modules/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../shared/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(40.0),
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    CustomTextField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      onSubmitt: (value) {
                        print(value);
                      },
                      onChange: (value) {
                        print(value);
                      },
                      label: 'Email',
                      prefix: const Icon(Icons.email),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      obsecure: isPassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: const Icon(Icons.lock),
                      suffix: IconButton(
                        onPressed: () {
                          // setState(() {
                          //   isPassword=!isPassword;
                          // });
                        },
                        icon: isPassword
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomButton(
                      text: 'login',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen()));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an accunt ?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                          },
                          child: const Text('Rigister now',style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }




}
