import 'package:flutter_second_app/models/cart.dart';
import 'package:flutter_second_app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatelogModel catalog;
  late CartModel cart;

  MyStore(){
    catalog = CatelogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}