import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:clickoncustomer/providers/category-provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_provider.dart';

class ProductsForYouList extends StatelessWidget {
  const ProductsForYouList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, child) => SizedBox(
        height: 320,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: ProductCard(product: value.productsForYou?[index]),
          ),
          itemCount: value.productsForYou?.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 250,
        ),
      ),
    );
  }
}
