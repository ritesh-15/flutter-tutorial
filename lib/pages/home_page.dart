// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/routes/navigation_routes.dart';
import 'package:flutter_application/widgets/home_widgets/CatelogHeader.dart';
import 'package:flutter_application/widgets/home_widgets/CatelogList.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application/models/Catelog.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: (() =>
            {Navigator.pushNamed(context, NavigationRoutes.cartRoute)}),
        child: const Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.mV32,
          child: Column(
            children: [
              const CatelogHeader(),
              if (CatelogModel.items != null && CatelogModel.items!.isNotEmpty)
                const CatelogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
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
