import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/components/web/recently-viewed-product-card.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';

class RecentlyViewedProducts extends StatelessWidget {
  final List<Categories> recently;
  const RecentlyViewedProducts({Key? key, required this.recently})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // child:  CarouselSlider(
            //   options: CarouselOptions(height: 290, initialPage: 1,viewportFraction: 0.15,aspectRatio: 1),
            //   items: recently.map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return RecentProductCard(image: i.image,);
            //       },
            //     );
            //   }).toList(),
            // ),
            height: 290,
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RecentProductCard(image: recently[index].image ?? ''),
                  ),
              itemCount: recently.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            )),
        Positioned(
            top: 88,
            right: 0,
            child: InkWell(
              onTap: () {

              },
              child: Container(
                height: 37,
                width: 37,
                child: Icon(Icons.keyboard_arrow_right_outlined),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:  canvasColor
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 3,
                  //     blurRadius: 5,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
              ),
            )),
        Positioned(
            top: 88,
            left: 0,
            child: InkWell(
              onTap: () {

              },
              child: Container(
                height: 37,
                width: 37, child: Icon(Icons.keyboard_arrow_left_outlined),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: canvasColor
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 3,
                  //     blurRadius: 5,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
              ),
            )),
      ],
    );
  }
}
