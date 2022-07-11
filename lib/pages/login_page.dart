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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() => {changeButton = true});
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, NavigationRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome $name",
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                        label: Text("User Name"),
                        hintText: "Username",
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Username cannot be empty!";
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Password cannot be empty!";
                        } else if (value != null && value.length < 6) {
                          return "Password length should be greater than 6!";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      color: Colors.deepPurple,
                      child: InkWell(
                          child: AnimatedContainer(
                            width: changeButton ? 50 : 150,
                            height: 50,
                            duration: const Duration(seconds: 1),
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                          onTap: () => moveToHome(context)),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
