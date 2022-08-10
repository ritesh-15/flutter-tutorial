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

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
