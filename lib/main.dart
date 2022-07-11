import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/routes/NavigationRoutes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      routes: {
        "/": (context) => LoginPage(),
        NavigationRoutes.loginRoute: (context) => LoginPage(),
        NavigationRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
