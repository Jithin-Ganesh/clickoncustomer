import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:flutter/cupertino.dart';

import '../../../components/web/home-product-box.dart';

class FashionStore extends StatelessWidget {
  final List<Categories> products;
  FashionStore({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 327,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 327,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ProductCard(image: products[index].image ?? ''),
                ),
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: HomeProductBox(
                width: 610,
                height: 325,
                image: "assets/images/dummy/image-offer.PNG"),
          )
        ],
      ),
    );
  }
}
