// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application/core/store.dart';
import 'package:flutter_application/models/Catelog.dart';

class CartModel {
  late CatelogModel _catelog;
  final List<int> _itemIds = [];

  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel catelog) {
    assert(catelog != null);
    _catelog = catelog;
  }

  List<Item?> get items =>
      _itemIds.map((e) => CatelogModel.findByID(e)).toList();

  num get totalPrice => items.fold(
      0,
      (previousValue, element) =>
          previousValue + (element != null ? element.price : 0));
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
