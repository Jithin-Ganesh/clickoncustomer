import 'package:clickoncustomer/web/components/product-card.dart';
import 'package:flutter/cupertino.dart';

class ProductsForYouList extends StatelessWidget {
  const ProductsForYouList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ProductCard(),
      ),itemCount: 7,scrollDirection: Axis.horizontal,),
    );
  }
}
