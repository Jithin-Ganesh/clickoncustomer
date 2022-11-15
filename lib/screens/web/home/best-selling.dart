import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:flutter/cupertino.dart';

class BestSelling extends StatelessWidget {
  final List<Categories> products;
  BestSelling({Key? key, required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 327,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: const HomeProductBox(width: 610, height: 325, image: "assets/images/dummy/image-5.png"),
          ),
            Expanded(
              child: SizedBox(
                height: 327,
                child:  ListView.builder(itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ProductCard(image: products[index].image ?? ''),
                ),itemCount: products.length,scrollDirection: Axis.horizontal,),
              ),
            )
        ],
      ),
    );
  }
}
