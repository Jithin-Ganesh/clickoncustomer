import 'package:clickoncustomer/components/web/product-card.dart';
import 'package:clickoncustomer/models/category.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../components/web/home-product-box.dart';
import '../../../providers/category-provider.dart';
import '../../../providers/home_provider.dart';

class FashionStore extends StatelessWidget {
  FashionStore({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, value, child) =>  Container(
        height: 327,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 327,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ProductCard(product: value.latestProducts?[index]),
                  ),
                  itemCount:  value.latestProducts?.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: HomeProductBox(
                  width: 610,
                  height: 325,
                  image: "assets/images/dummy/image-offer.PNG"),
            )
          ],
        ),
      ),
    );
  }
}
