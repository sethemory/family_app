import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_medial_tutorial/auth/auth.dart';
import 'package:flutter_social_medial_tutorial/auth/login_or_register.dart';
import 'package:flutter_social_medial_tutorial/firebase_options.dart';
import 'package:flutter_social_medial_tutorial/pages/test_pages/home_page.dart';
import 'package:flutter_social_medial_tutorial/pages/test_pages/profile_page.dart';
import 'package:flutter_social_medial_tutorial/pages/test_pages/users_page.dart';
import 'package:flutter_social_medial_tutorial/theme/dark_mode.dart';
import 'package:flutter_social_medial_tutorial/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => LoginOrRegister(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page':(context) => UsersPage(),
        '/auth_page':(context) => AuthPage(),
      },
    );
  }
}
