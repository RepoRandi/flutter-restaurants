import 'package:flutter/material.dart';
import 'package:restaurant/config/session/user_session.dart';
import 'package:restaurant/pages/login/login_page.dart';
import 'package:restaurant/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserSession().loggedInUser == null
          ? const LoginPage()
          : const MainPage(),
    );
  }
}
