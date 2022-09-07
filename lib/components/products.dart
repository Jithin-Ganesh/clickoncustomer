import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          Image.asset(imageProduct,height: 209,width: 185,),
          const SizedBox(
            height: 9.7,
          ),
          Text(
            textProductName,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
