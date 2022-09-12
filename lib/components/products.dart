import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color.dart';

class Products extends StatefulWidget {
  final double? height;
  const Products({Key? key, this.height}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: widget.height ?? 500,
      child: Column(
        children: [
          ImgProvider(
            url: "assets/images/dummy/image-watch.png",
            height: 210,
            width: 186,
          ),
          const SizedBox(
            height: 9.7,
          ),
          Text(
            textProductName,
            style: medium.copyWith(fontSize: 16,color: categoriesTextColor),
          )
        ],
      ),
    );
  }
}
