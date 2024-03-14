import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:e_books_website/modules/home/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/custom_text_field.dart';

class AddBookScreen extends StatelessWidget {
   AddBookScreen({super.key});
  var authorNameController = TextEditingController();
  var categoryController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder:(context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Add book',
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
                            return 'Book name must not be empty';
                          }
                        },
                        label: 'Book name',
                        prefix: const Icon(Icons.book),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: authorNameController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Author name must not be empty';
                          }
                        },
                        label: 'Author name',
                        prefix: const Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomTextField(
                        controller: categoryController,
                        type: TextInputType.text,
                        validate: (value) {
                          // if (value!.isEmpty) {
                          //   return ' ';
                          // }
                        },
                        onSubmitt: (value) {},
                        label: 'Category',
                        prefix: const Icon(Icons.category_outlined),

                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                          }
                        },
                        text: 'Add',
                        isUppercase: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        );
      },);
  }
}
