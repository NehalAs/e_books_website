import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/book_model.dart';
import 'home_states.dart';


 class HomeCubit extends Cubit<HomeStates>{
   HomeCubit() : super(HomeInitialState());
   static HomeCubit get(context)=> BlocProvider.of(context);

   List<BookModel> books =[];
   void getBooks()
   {
     FirebaseFirestore.instance.collection('books').snapshots()
         .listen((event) {
       books=[];
       event.docs.forEach((element) {
             books.add(BookModel.fromJson(element.data()));
       });
       emit(GetBooksSuccessState());
     });
   }


   void addBook(
       {
         required String cover,
         required String category,
         required String authorName,
         required String pdf,
       })
   {
     emit(AddBookLoadingState());
     var model= BookModel(
       cover: cover,
       category: category,
       authorName: authorName,
       voice: '',
       pdf: pdf,
     );
     FirebaseFirestore.instance
         .collection('books')
         .add(model.toJson())
         .then((value)
     {
       emit(AddBookSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(AddBookErrorState());
     });
   }
 }