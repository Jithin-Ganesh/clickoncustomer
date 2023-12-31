import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/providers/product-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../providers/category-provider.dart';
import '../../../providers/home_provider.dart';

class BestSelling extends StatelessWidget {
  BestSelling({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, child) => Container(
        height: 327,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 50.0),
              child: HomeProductBox(
                  width: 610,
                  height: 327,
                  image: "assets/images/dummy/image-5.png"),
            ),
            Expanded(
              child: SizedBox(
                height: 320,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: ProductCard(product: value.latestProducts?[index],),
                  ),
                  itemCount: value.latestProducts?.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
