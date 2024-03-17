import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:e_books_website/modules/home/cubit/home_states.dart';
import 'package:e_books_website/modules/shared/utils/app_ui.dart';
import 'package:e_books_website/modules/shared/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

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
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is AddBookSuccessState)
          {
            Navigator.pop(context);
          }
      },
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(State is AddBookLoadingState)
                      const LinearProgressIndicator(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () async {
                              await homeCubit.pickImage();
                            },
                            child: Image.asset(
                              'assets/images/img.png',
                              scale: 6,
                            )),
                        InkWell(
                            onTap: () async {
                              await homeCubit.pickAndUploadPDF();
                            },
                            child: Image.asset(
                              'assets/images/add-file.png',
                              scale: 6,
                            )),
                        InkWell(
                            onTap: () async {
                              await homeCubit.pickAndUploadAudio();
                            },
                            child: Image.asset(
                              'assets/images/add.png',
                              scale: 6,
                            )),

                        // Image.network(homeCubit.imageURL??''),
                      ],
                    ),
                   ConditionalBuilder(
                       condition: State is AddBookLoadingState,
                       builder: (context) => CircularProgressIndicator(color: AppUI.buttonColor),
                       fallback: (context) =>  CustomButton(
                         function: () {
                           var uuid = const Uuid();
                           var bookId=uuid.v4();
                           if (formKey.currentState!.validate()) {
                             homeCubit.addBook(
                               name: nameController.text,
                               cover: homeCubit.coverImage!,
                               category: categoryController.text,
                               authorName: authorNameController.text,
                               pdf: homeCubit.pdfUrl!,
                               voice: homeCubit.audioUrl!,
                               bookId: bookId
                             );
                           }
                         },
                         text: 'Add',
                         isUppercase: true,
                       ),
                   ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
