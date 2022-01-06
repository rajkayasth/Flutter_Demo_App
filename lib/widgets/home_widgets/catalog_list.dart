import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_second_app/Pages/home_detail_page.dart';
import 'package:flutter_second_app/models/catelog.dart';
import 'package:flutter_second_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
      final catalog = CatelogModel.getByPosition(index);
      return InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeDetailsPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog));
    }
      ,shrinkWrap: true,itemCount: CatelogModel.items.length,);
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key,required this.catalog}) :assert(catalog!=null), super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero
              (tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.imageUrl)),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.color(context.accentColor).make(),
                catalog.desc.text.caption(context).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                          shape: MaterialStateProperty.all(StadiumBorder())
                      ), child: "Add to Cart".text.make(),)
                  ],
                ).pOnly(right: 8.0)

              ],
            ))
          ],
        )
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
