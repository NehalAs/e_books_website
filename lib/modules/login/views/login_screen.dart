import 'package:e_books_website/modules/home/views/home_screen.dart';
import 'package:e_books_website/modules/login/cubit/login_cubit.dart';
import 'package:e_books_website/modules/login/cubit/login_states.dart';
import 'package:e_books_website/modules/register/views/register_screen.dart';
import 'package:e_books_website/modules/shared/utils/app_util.dart';
import 'package:e_books_website/modules/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState)
            {
              AppUtil.mainNavigator(
                  context, const HomeScreen());
            }
        },
        builder: (context, state) {
          LoginCubit loginCubit =LoginCubit.get(context);
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            obsecure: loginCubit.isPassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            onSubmitt: (value) {
                              if (formKey.currentState!.validate()) {
                                loginCubit.userLogin(email: emailController.text, password: passwordController.text);
                              }
                            },
                            label: 'Password',
                            prefix: const Icon(Icons.lock),
                            suffix: IconButton(
                              onPressed: () {
                                loginCubit.changePasswordVisibility();
                              },
                              icon: Icon(loginCubit.suffixIcon),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomButton(
                            text: 'login',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                loginCubit.userLogin(email: emailController.text, password: passwordController.text);
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
                                  AppUtil.mainNavigator(
                                      context, RegisterScreen());
                                },
                                child: const Text('Rigister now',
                                    style: TextStyle(color: Colors.blue)),
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
        },
      ),
    );
  }


}
