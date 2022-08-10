import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/Cart.dart';
import 'package:flutter_application/models/Catelog.dart';
import 'package:velocity_x/velocity_x.dart';

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
  CartModel cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(widget.catelog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          CatelogModel model = CatelogModel();
          cart.catelog = model;
          cart.add(widget.catelog);
          setState(() {});
        }
      },
      style:
          ButtonStyle(shape: MaterialStateProperty.all(const StadiumBorder())),
      child: isInCart
          ? const Icon(Icons.done)
          : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
