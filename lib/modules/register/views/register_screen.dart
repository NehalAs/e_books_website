import 'package:e_books_website/modules/activiation_requests/cubit/requests_cubit.dart';
import 'package:e_books_website/modules/register/cubit/register_cubit.dart';
import 'package:e_books_website/modules/register/cubit/register_state.dart';
import 'package:e_books_website/modules/shared/utils/app_util.dart';
import 'package:e_books_website/modules/shared/widgets/custom_button.dart';
import 'package:e_books_website/modules/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is CreateUserSuccessState)
            {
              Navigator.pop(context);
              RequestsCubit.get(context).sendRequest(
                senderId: state.uId,
                senderMail: emailController.text, receiverId: 'vGTzxfMsmaUVSIe0Z1tZSfv9mmm2', dateTime: DateTime.now().toString());
            }
          if(state is RegisterErrorState)
            {
              AppUtil.showToast(message: state.error);
            }
        },
        builder: (context, state) {
          RegisterCubit registerCubit = RegisterCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        CustomTextField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Name must not be empty';
                            }
                          },
                          label: 'Name',
                          prefix: const Icon(Icons.person),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomTextField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Email adress must not be empty';
                            }
                          },
                          label: 'Email',
                          prefix: const Icon(Icons.email_outlined),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          obsecure: registerCubit.isPassword,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                          },
                          onSubmitt: (value) {},
                          label: 'Password',
                          prefix: const Icon(Icons.lock_outline),
                          suffix: IconButton(
                              onPressed: () {
                                registerCubit.changePasswordVisibility();
                              },
                            icon: Icon( registerCubit.suffixIcon),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              registerCubit.userRegister(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                              );
                            }
                          },
                          text: 'register',
                          isUppercase: true,
                        ),
                      ],
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
