import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:flutter/cupertino.dart';

import '../../../components/web/home-product-box.dart';

class FashionStore extends StatelessWidget {
  FashionStore({Key? key}) : super(key: key);
  final List<Widget> rowList = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ProductCard(),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ProductCard(),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ProductCard(),
    ), Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ProductCard(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 327,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: rowList,
              ),
            ),
          ),
          HomeProductBox(width: 610, height: 325, image: "assets/images/dummy/image-offer.PNG"),
        ],
      ),
    );
  }
}
