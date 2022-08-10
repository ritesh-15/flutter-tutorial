import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/routes/navigation_routes.dart';
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
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          appBarTheme: const AppBarTheme(color: Colors.white)),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        NavigationRoutes.loginRoute: (context) => LoginPage(),
        NavigationRoutes.homeRoute: (context) => HomePage()
      },
    );
  }
}
