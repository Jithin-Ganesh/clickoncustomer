import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:flutter/cupertino.dart';

import '../../../components/web/home-product-box.dart';

class FashionStore extends StatelessWidget {
  FashionStore({Key? key}) : super(key: key);
  final List<Widget> rowList = [
    ProductCard(),
    ProductCard(),
    ProductCard(),
    ProductCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 327,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...rowList,
          HomeProductBox(width: 610, height: 325, image: "assets/images/dummy/image-offer.PNG"),
        ],
      ),
    );
  }
}
