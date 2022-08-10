// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/Cart.dart';
import 'package:flutter_application/routes/navigation_routes.dart';
import 'package:flutter_application/widgets/home_widgets/CatelogHeader.dart';
import 'package:flutter_application/widgets/home_widgets/CatelogList.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_application/models/Catelog.dart';

import 'package:http/http.dart' as http;

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
    final CartModel cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        builder: (context, state, _) {
          return FloatingActionButton(
            onPressed: (() =>
                {Navigator.pushNamed(context, NavigationRoutes.cartRoute)}),
            child: const Icon(CupertinoIcons.cart),
          ).badge(
              count: cart.items.length,
              color: Colors.red,
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              size: 20);
        },
        mutations: const {RemoveMutation, AddMutation},
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
