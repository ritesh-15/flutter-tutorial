import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/models/Catelog.dart';
import 'package:flutter_application/widgets/Item_Widget.dart';
import 'package:flutter_application/widgets/drawer.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

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
        child: CatelogModel.items != null && CatelogModel.items?.length != 0
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatelogModel.items![index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: GridTile(
                        header: Container(
                          decoration:
                              const BoxDecoration(color: Colors.deepPurple),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        footer: Container(
                          decoration: const BoxDecoration(color: Colors.black),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "\$${item.price}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        child: Image.network(item.image),
                      ));
                },
                itemCount: CatelogModel.items?.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catelogJson = await rootBundle.loadString("assets/json/catelog.json");
    var decodedJson = jsonDecode(catelogJson);
    var products = decodedJson["products"];
    CatelogModel.items =
        List.from(products).map<Item>((item) => Item.fromJson(item)).toList();
    setState(() {});
  }
}
