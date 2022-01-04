import 'package:flutter/material.dart';
import 'package:flutter_second_app/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key,required this.item}) :
        assert (item != null ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} Pressed");
        },
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),textScaleFactor: 1.5,),
      ),
    );
  }
}
