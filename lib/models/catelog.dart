class CatelogModel{
  static  List<Item> items = [Item(
      id: 1,
      name: "Iphone 12 pro",
      desc: "Apple Iphone 12th generation",
      price: 999,
      color: "33505A",
      imageUrl: "https://m.media-amazon.com/images/I/71MHTD3uL4L.jpg"
  )];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;


  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageUrl});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageUrl: map["imageUrl"],
    );
  }
  toMap() => {
    "id" : id,
    "name" : name,
    "desc" : desc,
    "price" : price,
    "color" : color,
    "imageUrl" : imageUrl,
  };

}