import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/global-key.dart';
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
            width: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Big',
                      style: medium.copyWith(fontSize: 84, color: canvasColor),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Image.asset(
                      item,
                      height: 234,
                      width: 400,
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Text(
                      'Deals',
                      style: medium.copyWith(fontSize: 84, color: canvasColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Save up to 50% on Selected Electronics Home Appliances ',
                  style: regular.copyWith(color: canvasColor, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 165,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Text(
                          'Shop Now',
                          style: medium.copyWith(
                              color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(),
                        Image.asset(
                          "assets/images/icon-arrow-right.png",
                          width: 5,
                          height: 10,
                        ),
                        const SizedBox()
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: canvasColor,
                        elevation: 0),
                  ),
                ),
                // CarouselIndicator(
                //   height: 3,
                //   width: 100,
                //   index: 1,
                //   activeColor: canvasColor,color: canvasColor.withOpacity(0.4),
                // ),
              ],
            ))))
    .values
    .toList();

class HomeBannerCarousel extends StatelessWidget {
  const HomeBannerCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
            colors: [
              Color(0xFFFE9568),
              Color(0xFFFAE0AD),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
