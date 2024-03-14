import 'package:e_books_website/modules/home/views/home_screen.dart';
import 'package:e_books_website/modules/login/views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home/cubit/home_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCmKG7H3F6oaxutkx29AZnnXLQoqctawow",
          authDomain: "e-books-web.firebaseapp.com",
          projectId: "e-books-web",
          storageBucket: "e-books-web.appspot.com",
          messagingSenderId: "20137768454",
          appId: "1:20137768454:web:c6921830f77c0fc2823587",
          measurementId: "G-KQHHX1KPFB"
      )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:HomeScreen(),
        )

    );
  }
}
