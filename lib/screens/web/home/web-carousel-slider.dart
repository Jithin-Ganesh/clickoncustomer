import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/global-key.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          height: 460,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(image: AssetImage( 'assets/images/dummy/image-carousel-dummy.png',),fit: BoxFit.fill)
          ),
          // child: ImgProvider(
          //   url: item,height: 460,boxFit: BoxFit.fill,width: 1600 ,
          // ),
        )))
    .values
    .toList();

class HomeBannerCarousel extends StatefulWidget {
  const HomeBannerCarousel({Key? key}) : super(key: key);

  @override
  State<HomeBannerCarousel> createState() => _HomeBannerCarouselState();
}

class _HomeBannerCarouselState extends State<HomeBannerCarousel> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 460,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          width: MediaQuery.of(context).size.width * 0.85,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 4,
              enlargeCenterPage: true,viewportFraction: 1,onPageChanged:(index, reason) {
              setState(() {
                currentPage = index;
              });
            }
            ),
            items: imageSliders,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 500,
          child: Row(
            children: imgList
                .asMap()
                .map((i, item) => MapEntry(
                i,
                ImageIndicators(currentPage: currentPage, index: i)))
                .values
                .toList(),
          ),
          // child: Row(
          //   children: imgList.map(
          //         (e) {
          //       return ImageIndicators(currentPage: currentPage, index: currentPage);
          //     },
          //   ).toList(),
          // ),
        )
      ],
    );
  }
}

class ImageIndicators extends StatelessWidget {
  const ImageIndicators({
    Key? key,
    required this.currentPage,
    required this.index,
  }) : super(key: key);

  final int currentPage;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:
            currentPage == index ? canvasColor : canvasColor.withOpacity(0.4),
      ),
    );
  }
}
