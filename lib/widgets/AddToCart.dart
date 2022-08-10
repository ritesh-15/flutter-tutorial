import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/Cart.dart';
import 'package:flutter_application/models/Catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catelog;

  AddToCart({
    super.key,
    required this.catelog,
  });

  CartModel cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(catelog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          CatelogModel model = CatelogModel();
          cart.catelog = model;
          cart.add(catelog);
        }
      },
      style:
          ButtonStyle(shape: MaterialStateProperty.all(const StadiumBorder())),
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}