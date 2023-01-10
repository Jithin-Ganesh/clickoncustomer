
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color.dart';
import '../utils/constants/fontstyles.dart';

class Products extends StatefulWidget {
  final double? height;
  final String image;
  final String title;
  const Products({Key? key, this.height, required this.image, required this.title}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: widget.height ?? 500,
      width: MediaQuery.of(context).size.width * 0.096,
      child: Column(
        children: [
          ImgProvider(
            url: widget.image,
            height: 210,
            width: MediaQuery.of(context).size.width * 0.096,
          ),
          const SizedBox(
            height: 8.7,
          ),
          Text(maxLines:1,
            widget.title,
            style: medium.copyWith(fontSize: 16,color: categoriesTextColor),
          )
        ],
      ),
    );
  }
}
