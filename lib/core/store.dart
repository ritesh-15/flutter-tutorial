// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application/models/Cart.dart';
import 'package:flutter_application/models/Catelog.dart';

class MyStore extends VxStore {
  late CatelogModel catelog;
  late CartModel cart;

  MyStore() {
    catelog = CatelogModel();
    cart = CartModel();
    cart.catelog = catelog;
  }
}
