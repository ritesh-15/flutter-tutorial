// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application/models/Cart.dart';
import 'package:flutter_application/models/Catelog.dart';
import 'package:flutter_application/pages/home_detail_page.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/widgets/home_widgets/CatelogImage.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items?.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.findByPosition(index)!;
        return InkWell(
            child: CatelogItem(catelog: catelog),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catelog: catelog))));
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catelog.id.toString()),
            child: CatelogImage(image: catelog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.lg.bold.make(),
            catelog.desc.text.sm.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catelog.price}".text.xl.bold.make(),
                AddToCart(catelog: catelog)
              ],
            )
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class AddToCart extends StatefulWidget {
  final Item catelog;

  const AddToCart({
    super.key,
    required this.catelog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        CatelogModel model = CatelogModel();
        CartModel cart = CartModel();
        cart.catelog = model;
        cart.add(widget.catelog);
        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : "Add To Cart".text.make(),
      style: ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
