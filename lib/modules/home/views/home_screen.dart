import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:e_books_website/modules/home/cubit/home_states.dart';
import 'package:e_books_website/modules/home/views/add_book_screen.dart';
import 'package:e_books_website/modules/home/views/widgets/book_item.dart';
import 'package:e_books_website/modules/shared/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, states) {
          HomeCubit homeCubit =HomeCubit.get(context);
          homeCubit.getBooks();
          return  Scaffold(
            appBar: AppBar(
              actions: [
                InkWell(
                  onTap: () {
                    print('object');
                    AppUtil.mainNavigator(context, AddBookScreen());
                  },
                  // onHover: (value) {
                  //   print('$value');
                  // },
                  child: Container(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add Book'),
                  )),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(onPressed: (){
              homeCubit.addBook(name: 'n',cover: '', category: 'romance', authorName: 'nehal',pdf:'');
            },
            child: const Icon(Icons.add),
            ),
            body: ListView.builder(itemBuilder:(context, index) => BookListViewItem(model:homeCubit.books[index]),itemCount:homeCubit.books.length),
          );
        }
    );
  }
}

