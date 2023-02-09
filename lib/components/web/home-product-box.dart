import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProductBox extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  const HomeProductBox({Key? key, required this.width, required this.height, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(image),fit: BoxFit.fill
          )
      ),
    );
  }
}
