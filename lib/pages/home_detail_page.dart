// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application/models/Catelog.dart';
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
      appBar: AppBar(
        elevation: 0,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mH8,
        children: [
          "\$${catelog.price}".text.xl4.bold.make(),
          ElevatedButton(
            onPressed: () {},
            child: "Buy".text.make(),
            style:
                ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())),
          ).wh(100, 50)
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
                child: Column(
                  children: [
                    catelog.name.text.xl4.bold.make(),
                    catelog.desc.text.xl.textStyle(context.captionStyle).make(),
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
