import 'package:flutter_second_app/Core/Store.dart';
import 'package:flutter_second_app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  late CatelogModel _catalog;
  //Collection of ID
  final List<int> _itemId =[];

  CatelogModel get catalog => _catalog;

  set catalog(CatelogModel newCatalog){
    assert(newCatalog !=  null);
    _catalog = newCatalog;
  }
  //Get items in Cart
  List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0,(total,current) => total + current.price );

  //Add item
  void add(Item item){
    _itemId.add(item.id);
  }

  //Remove item

}

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemId.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemId.remove( item.id);
  }
}