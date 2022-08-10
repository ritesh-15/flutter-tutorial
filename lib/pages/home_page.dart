import 'package:flutter/material.dart';
import 'package:flutter_application/models/Catelog.dart';
import 'package:flutter_application/widgets/Item_Widget.dart';
import 'package:flutter_application/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatelogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: CatelogModel.items[index]);
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
