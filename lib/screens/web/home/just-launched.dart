import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class JustLaunchedList extends StatelessWidget {
  const JustLaunchedList({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, value, child) => Container(
        height: 306,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: HomeProductBox(
              height: 306,
              width: MediaQuery.of(context).size.width * 0.154,
              image: value.latestProducts?[index].images ??"",
            ),
          ),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemCount: value.latestProducts?.length,
        ),
      ),
    );
  }
}
