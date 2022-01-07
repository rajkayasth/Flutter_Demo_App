import 'package:flutter/material.dart';
import 'package:flutter_second_app/models/catelog.dart';
import 'package:flutter_second_app/widgets/add_to_cart.dart';
import 'package:flutter_second_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key,required this.catalog}) :assert(catalog!=null) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent),
      backgroundColor : context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.imageUrl)).h32(context),
            Expanded(child:
              VxArc(
                  height: 30.0,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                 child: Container(
                   color: context.cardColor,
                   width: context.screenWidth,
                   child: Column(
                     children: [
                       catalog.name.text.xl3.bold.color(context.accentColor).make(),
                       catalog.desc.text.caption(context).make(),
                       10.heightBox,
                     ],
                   ).p64(),
                 )))
          ],
        ),
      ),
    );
  }
}
