class CatelogModel {
  static final catelogModel = CatelogModel._internal();

  CatelogModel._internal();

  factory CatelogModel() => catelogModel;

  static List<Item>? items;

  static Item? findByID(int id) {
    return items?.firstWhere((element) => element.id == id);
  }

  static Item? findByPosition(int position) {
    return items?.elementAt(position);
  }
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromJson(Map<String, dynamic> map) => Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"]);

  toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
