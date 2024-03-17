import 'package:e_books_website/modules/activiation_requests/cubit/requests_cubit.dart';
import 'package:e_books_website/modules/home/views/add_book_screen.dart';
import 'package:e_books_website/modules/home/views/home_screen.dart';
import 'package:e_books_website/modules/login/views/login_screen.dart';
import 'package:e_books_website/modules/shared/cash_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home/cubit/home_cubit.dart';
import 'modules/shared/bloc_observer.dart';
import 'modules/shared/constants.dart';
import 'modules/shared/utils/app_ui.dart';

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
  } else {
    await Firebase.initializeApp();
  }
  userId = await CashHelper.getSavedString('uId', '');
  print('iddddddddddddddddddddddddddddddddddddddddddd$userId');
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeCubit()..getBooks()..getUserData(),
        ),
        BlocProvider(
          create: (context) => RequestsCubit(),
        ),
      ],
      child: MaterialApp(
        // theme: ThemeData(
        //   scaffoldBackgroundColor: AppUI.scaffoldColor,
        //   appBarTheme: AppBarTheme(color: AppUI.appbarColor)
        // ),
        debugShowCheckedModeBanner: false,
        home: userId == '' ? LoginScreen() : const HomeScreen(),
      ),
    );
  }
}
