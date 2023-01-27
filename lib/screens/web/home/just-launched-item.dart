import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/product-model.dart';

import '../../../utils/constants/fontstyles.dart';
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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ImgProvider(
            url: product?.thumbnail ?? "",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, left: 29, bottom: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.name ?? "",
                  style: thin.copyWith(fontSize: 22, color: Colors.white),
                ),
                Text(
                  "${product?.price.toString()}",
                  style: medium.copyWith(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
