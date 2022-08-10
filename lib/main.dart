import 'package:flutter/material.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/pages/cart_page.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/routes/navigation_routes.dart';
import 'package:flutter_application/widgets/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        NavigationRoutes.loginRoute: (context) => const LoginPage(),
        NavigationRoutes.homeRoute: (context) => const HomePage(),
        NavigationRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
