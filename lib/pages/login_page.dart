import 'package:flutter/material.dart';
import 'package:flutter_application/routes/NavigationRoutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            Text(
              "Welcome $name",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("User Name"), hintText: "Username"),
                    onChanged: (value) {
                      name = value;
                      setState(() => {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Password"), hintText: "Password"),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: AnimatedContainer(
                      width: changeButton ? 50 : 150,
                      height: 50,
                      duration: const Duration(seconds: 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8)),
                      child: changeButton
                          ? const Icon(Icons.done, color: Colors.white)
                          : const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                    onTap: () async {
                      setState(() => {changeButton = true});
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.pushNamed(context, NavigationRoutes.homeRoute);
                    },
                  )
                  // ElevatedButton(
                  //     child: const Text("Login"),
                  //     onPressed: () => {
                  //           Navigator.pushNamed(
                  //               context, NavigationRoutes.homeRoute)
                  //         },
                  //     style: TextButton.styleFrom(
                  //         minimumSize: const Size(100, 50)))
                ],
              ),
            )
          ],
        ));
  }
}
