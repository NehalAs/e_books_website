import 'package:e_books_website/modules/shared/widgets/custom_button.dart';
import 'package:e_books_website/modules/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(40.0),
              width: 500,
              //height: 500,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
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
                      type:TextInputType.name,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
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
                      type:TextInputType.emailAddress,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
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
                      type:TextInputType.visiblePassword,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
                          return 'Password is too short';
                        }
                      },
                      onSubmitt: (value) {},
                      label: 'Password',
                      prefix: const Icon(Icons.lock_outline),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      type:TextInputType.phone,
                      validate: (value) {
                        if(value!.isEmpty)
                        {
                          return 'Phone must not be empty';
                        }
                      },
                      label: 'Phone',
                      prefix: const Icon(Icons.phone),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),

                    CustomButton(
                      function: () {
                        if(formKey.currentState!.validate())
                        {
                        }
                      },
                      text: 'register',
                      isUppercase: true,),
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