import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/Cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          elevation: 0,
          title: "Cart".text.make(),
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                CartList().p32().expand(),
                Divider(),
                const CartTotal()
              ],
            )));
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              mutations: const {RemoveMutation},
              builder: (context, status, _) =>
                  "\$${cart.totalPrice}".text.xl4.bold.make()),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  child: "Buy".text.white.make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple)))
              .w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final CartModel cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              RemoveMutation(item: cart.items[index]!);
            },
          ),
          title: "${cart.items[index]?.name}".text.make(),
        );
      },
    );
  }
}
