import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:flutter/cupertino.dart';

class BestSelling extends StatelessWidget {
 BestSelling({Key? key}) : super(key: key);
  final List<Widget> rowList = [
  const Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    child: ProductCard(image: "assets/images/dummy/product-1.png" ),
  ),
  const Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    child: ProductCard(image: "assets/images/dummy/product-2.png" ),
  ),
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: const ProductCard(image: "assets/images/dummy/product-3.png" ),
    ), const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: const ProductCard(image: "assets/images/dummy/product-4.png" ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 327,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HomeProductBox(width: 610, height: 325, image: "assets/images/dummy/image-5.png"),
            Expanded(
              child: SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: rowList,
                ),
              ),
            )
        ],
      ),
    );
  }
}
