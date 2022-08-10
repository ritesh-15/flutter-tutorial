// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application/models/Catelog.dart';
import 'package:flutter_application/widgets/AddToCart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mH8,
        children: [
          "\$${catelog.price}".text.xl4.bold.make(),
          AddToCart(catelog: catelog)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catelog.id.toString()),
                    child: Image.network(catelog.image))
                .p32()
                .h32(context),
            Expanded(
                child: VxArc(
              height: 10,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catelog.name.text.xl4.bold.make(),
                    catelog.desc.text.xl.textStyle(context.captionStyle).make(),
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."
                        .text
                        .make()
                        .p16()
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
