import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_second_app/models/catelog.dart';
import 'package:flutter_second_app/widgets/drawer.dart';
import 'package:flutter_second_app/widgets/item_Widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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



    CatelogModel.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(10, (index) => CatelogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catelog App',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  ListView.builder(itemCount: CatelogModel.items.length,itemBuilder: (context,index){
          return ItemWidget(item: CatelogModel.items[index],);
        },),
      ),
      drawer: MyDrawer(),
    );
  }
}
