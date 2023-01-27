import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProductBox extends StatelessWidget {

  final double width;
  final double height;
  final String image;
  const HomeProductBox(
      {Key? key,
      required this.width,
      required this.height,
      required this.image,
     })
      : super(key: key);

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
            url: image,
          ),
        ],
      ),
    );
  }
}
