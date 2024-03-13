import 'package:bloc/bloc.dart';
import 'package:e_books_website/modules/login/cubit/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


 class LoginCubit extends Cubit<LoginStates>{
   LoginCubit() : super(LoginInitialState());
   static LoginCubit get(context)=> BlocProvider.of(context);
   IconData suffixIcon =  Icons.visibility;
   bool isPassword = true;
   void userLogin(
   {
     required String email,
     required String password
    }
    )
   {
     emit(LoginLoadingState());

     FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password

     ).then((value) {
       emit(LoginSuccessState(value.user!.uid));
     }).catchError((error){
       print(error.toString());
       emit(LoginErrorState(error.toString()));
     });
   }

   void changePasswordVisibility()
   {
     isPassword=!isPassword;
     isPassword? suffixIcon =  Icons.visibility : suffixIcon = Icons.visibility_off;
     emit(ChangePasswordVisibilityState());
   }

 }