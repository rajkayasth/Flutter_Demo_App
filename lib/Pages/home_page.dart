import 'package:flutter/cupertino.dart';
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
   // print(productData);



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
        child: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)?
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 16),
              itemBuilder: (context,index){
                final item = CatelogModel.items[index];
                
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: GridTile(
                        header: Container(
                          padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple
                            ),
                            child: Text(item.name,style: TextStyle(color: Colors.white),)),
                        footer: Container(child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.black
                          ),),
                        child: Image.network(item.imageUrl)));
              },
              itemCount: CatelogModel.items.length,)
          :Center(child: CircularProgressIndicator(),)
      ),
      drawer: MyDrawer(),
    );
  }
}
/*ListView.builder(itemCount: CatelogModel.items.length,itemBuilder: (context,index){
          return ItemWidget(item: CatelogModel.items[index],);
        },)*/