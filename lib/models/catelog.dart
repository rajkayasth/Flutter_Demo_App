class CatelogModel{
  static  List<Item> items = [] ;
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;


  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'desc': this.desc,
      'price': this.price,
      'color': this.color,
      'imageUrl': this.imageUrl,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}