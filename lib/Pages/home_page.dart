import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_second_app/Core/Store.dart';
import 'package:flutter_second_app/Utils/routes.dart';
import 'package:flutter_second_app/models/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_second_app/models/catelog.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async {
    var cateLogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(cateLogJson);

    var productData = decodedData["products"];
   // print(productData);



    CatelogModel.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(10, (index) => CatelogModel.items[0]);
    final _cart = (VxState.store as MyStore ).cart;
    return Scaffold(
      backgroundColor: context.cardColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder: (context,store,status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
          backgroundColor: context.theme.buttonColor,
        ).badge(color: Vx.amber500,size: 20,count: _cart.items.length,textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatelogModel.items!=null && CatelogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      )
    );
  }
}
/*ListView.builder(itemCount: CatelogModel.items.length,itemBuilder: (context,index){
          return ItemWidget(item: CatelogModel.items[index],);
        },)*/




