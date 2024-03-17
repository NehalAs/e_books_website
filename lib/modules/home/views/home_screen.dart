import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_books_website/modules/home/cubit/home_cubit.dart';
import 'package:e_books_website/modules/home/cubit/home_states.dart';
import 'package:e_books_website/modules/home/views/add_book_screen.dart';
import 'package:e_books_website/modules/home/views/widgets/book_item.dart';
import 'package:e_books_website/modules/shared/cash_helper.dart';
import 'package:e_books_website/modules/shared/utils/app_ui.dart';
import 'package:e_books_website/modules/shared/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../activiation_requests/views/requests_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, states) {
          HomeCubit homeCubit =HomeCubit.get(context);
          return  Scaffold(
            appBar:AppBar(
              actions: [
                if(HomeCubit.get(context).userModel !=null &&HomeCubit.get(context).userModel?.userType=='admin')...[
                  InkWell(
                    onTap: () {
                      AppUtil.mainNavigator(context, RequestsScreen());
                    },
                    child: const Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                      child: Text('Activation Requests'),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    AppUtil.mainNavigator(context, AddBookScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                    child: Text('Add Book'),
                  ),
                ),
                ],
                InkWell(
                  onTap: () {

                    CashHelper.logOut(context);
                    },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                    child: Text('Log out'),
                  ),
                ),
              ],
            ),
            body: ListView.builder(
                // separatorBuilder: (context, index) => Divider(color: AppUI.buttonColor,height: 0.1),
                itemBuilder:(context, index) => BookListViewItem(model:homeCubit.books[index]),itemCount:homeCubit.books.length),
          );
        }
    );
  }
}

