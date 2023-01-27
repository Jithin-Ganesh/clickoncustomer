import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'just-launched-item.dart';

class JustLaunchedList extends StatelessWidget {
  const JustLaunchedList({Key? key, this.productList})
      : super(key: key);
  final List<ProductModel>? productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 306,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: JustLaunchedItem(
            height: 306,
            width: MediaQuery.of(context).size.width * 0.154,product: productList?[index],
          ),
        ),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: productList?.length,
      ),
    );
  }
}
