import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:e_books_website/modules/home/cubit/home_states.dart';
import 'package:e_books_website/modules/home/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, states) {
            HomeCubit homeCubit =HomeCubit.get(context);
            homeCubit.getBooks();
            return  Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: (){
                homeCubit.addBook(cover: '', category: 'romance', authorName: 'nehal',pdf:'');
              },
              child: const Icon(Icons.add),
              ),
              body: ListView.builder(itemBuilder:(context, index) => BookListViewItem(model:homeCubit.books[index]),itemCount:homeCubit.books.length),
            );
          }
      ),
    );
  }
}

