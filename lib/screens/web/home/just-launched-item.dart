import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/product-model.dart';

import '../../../utils/constants/fontStyles/kanit.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/img-provider.dart';

class JustLaunchedItem extends StatelessWidget {
  final double width;
  final double height;
  final ProductModel? product;
  const JustLaunchedItem({
    Key? key,
    required this.width,
    required this.height,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailScreenWeb.routeName,arguments: ProductDetailScreenWeb(productId: product?.id,));
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ImgProvider(
              url: product?.thumbnail ?? "",
              radius: 10, height: 306,
              width: MediaQuery.of(context).size.width * 0.154,
              boxFit: BoxFit.fill,
            ),
            Positioned(
              bottom: 21,
              left: 23,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product?.name ?? "",
                    style: thin.copyWith(fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    "₹ ${product?.price.toString()}",
                    style: medium.copyWith(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
