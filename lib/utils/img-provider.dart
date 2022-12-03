
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'images.dart';
class ImgProvider extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final BoxFit? placeHolderBoxFit;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final double? radius;

  //width, height, fit ....
  const ImgProvider({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.color = canvasColor,
    this.padding,
    this.border,
    this.radius, this.placeHolderBoxFit,
  }) : super(key: key);

  Widget _image() {
    // assets/icon-image.png
    // https://www.image.com/a3.png

    //url
    if (url == "") {
      return Image.asset('assets/images/placeholder.jpg');
    } else if (url.contains("http") || url.contains("https")) {
      return CachedNetworkImage(
        imageUrl: url,
        fit: boxFit,
        placeholder: (context, url) => Image.asset('assets/images/placeholder.jpg'),
        errorWidget: (context, url, error) =>
            Image.asset('assets/images/placeholder.jpg'),
      );
      //return FadeInImage.assetNetwork(placeholder: placeholder, image: url, fit: boxFit,imageErrorBuilder: ,);
    } else if (url.contains('svg')) {
      return SvgPicture.asset(url);
    } else if (['png', 'jpg', 'jpeg'].contains(url.split(".").last)) {
      return Image(
        image: AssetImage(url),
        fit: boxFit,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            border: border,
            borderRadius: BorderRadius.circular(radius ?? 0.0),
          ),
          height: height,
          width: width ?? MediaQuery.of(context).size.width,
          child: _image()),
    );
  }
}
