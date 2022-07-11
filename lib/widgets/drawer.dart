import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: const UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: const Text("Ritesh Khore"),
                accountEmail: const Text("riteshkhore@gmail.com"),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: const NetworkImage(
                      "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                ),
              )),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail),
            title: Text(
              "Email Me",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
