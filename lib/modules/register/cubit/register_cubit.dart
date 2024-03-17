import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_books_website/modules/register/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData suffixIcon = Icons.visibility;
  bool isPassword = true;
  void userRegister(
      {
        required String email,
        required String name,
        required String password,
      }
      )
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
        email: email,
        name: name,
        uId: value.user!.uid,
      );
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });

  }

  void userCreate(
      {
        required String email,
        required String name,
        required String uId,
      })
  {
    var model= UserModel(
        email: email,
        name: name,
        uId: uId,
        verificationStatus: "pending",
        userType:"user",
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toJson()).then((value){
      emit(CreateUserSuccessState(uId));
    }).catchError((error){
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  void changePasswordVisibility()
  {
    isPassword=!isPassword;
    isPassword? suffixIcon =  Icons.visibility : suffixIcon = Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }
}
