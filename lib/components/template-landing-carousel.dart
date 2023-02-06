import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/img-provider-2.dart';

final List<String> imgList = [
  'assets/images/dummy/image-carousel-dummy.png',
  'assets/images/dummy/image-carousel-dummy.png',
  'assets/images/dummy/image-carousel-dummy.png',
  'assets/images/dummy/image-carousel-dummy.png',
  'assets/images/dummy/image-carousel-dummy.png',
];

final List<Widget> imageSliders = imgList
    .asMap()
    .map((i, item) => MapEntry(
        i,
        Container(
          height: 450,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    item,
                  ),
                  fit: BoxFit.fill)),
          // child: ImgProvider(
          //   url: item,height: 460,boxFit: BoxFit.fill,width: 1600 ,
          // ),
        )))
    .values
    .toList();

class TemplateLandingCarousel extends StatefulWidget {
  const TemplateLandingCarousel({Key? key}) : super(key: key);

  @override
  State<TemplateLandingCarousel> createState() =>
      _TemplateLandingCarouselState();
}

class _TemplateLandingCarouselState extends State<TemplateLandingCarousel> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          scrollPhysics: const NeverScrollableScrollPhysics(),
          autoPlay: true,
          aspectRatio: 3,
          enlargeCenterPage: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              currentPage = index;
            });
          }),
      items: imageSliders
          ?.asMap()
          .map((i, item) => MapEntry(
              i,
              Container(
                height: 450,
                // decoration:  BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //     image: DecorationImage(
                //         image: AssetImage(
                //           item.image ?? '',
                //         ),
                //         fit: BoxFit.fill)),
                child: ImgProvider2(
                  url: imgList[i],
                  boxFit: BoxFit.fill,
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                ),
              )))
          .values
          .toList(),
    );
  }
}
