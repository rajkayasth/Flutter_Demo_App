import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second_app/Core/Store.dart';
import 'package:flutter_second_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(Colors.black).make().pOnly(left: 15),
      ),
      body: Column(
        children: [
          _CartList ().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder<MyStore>(

            mutations: {RemoveMutation},
            builder: (context, store, status) =>"\$${_cart.totalPrice}"
                .text
                .xl5
                .color(context.theme.accentColor)
                .make(),
          ),
          //
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "BYing Feature not Supported".text.make()));
              }, child: "Buy".text.white.make()
          ).w32(context)
        ],
      ),
    );
  }
}


class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    if (_cart.items.isEmpty) {
      return "Nothing to show in cart".text.makeCentered();
    } else {
      return ListView.builder(
        itemBuilder: (context,index) => ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  //setState(() {});
                    },),
            title: _cart.items[index].name.text.make(),
    ),
        itemCount: _cart?.items.length);
    }
  }
}
