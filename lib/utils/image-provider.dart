import 'package:cached_network_image/cached_network_image.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:flutter/cupertino.dart';

class ImageProvider2 extends StatelessWidget {
  final String url;
  const ImageProvider2({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Image.asset('assets/images/logo-image.png'),
      errorWidget: (context, url, error) =>
          Image.asset('assets/images/logo-image.png'),
      fit: BoxFit.fill,
    );
  }
}
