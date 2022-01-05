import 'package:flutter/material.dart';
import 'package:flutter_second_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
        "Tranding Products".text.xl2.make(),
      ],
    );
  }
}
