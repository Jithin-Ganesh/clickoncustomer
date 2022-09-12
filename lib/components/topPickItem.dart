import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'products.dart';

class TopPickItem extends StatefulWidget {
  const TopPickItem({super.key});

  @override
  State<TopPickItem> createState() => _TopPickItemState();
}

class _TopPickItemState extends State<TopPickItem> {
  late CarouselController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = CarouselController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        CarouselSlider(carouselController: controller,
          options: CarouselOptions(height: 290, initialPage: 1,viewportFraction: 0.2,aspectRatio: 1),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return const Products();
              },
            );
          }).toList(),
        ),
        Positioned(
            top: 88,
            right: 0,
            child: InkWell(
              onTap: (){
                controller.previousPage();
              },
              child: Container(
                height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                    image: DecorationImage(
                      image: AssetImage("assets/images/icon-arrow-right-circle.png"),fit: BoxFit.fitHeight
                    )
                  ),
              ),
            )),
        Positioned(
            top: 88,
            left: 0,
            child:  InkWell(
              onTap: (){
                controller.nextPage();
              },
              child: Container(
                height: 37,
                width: 37,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                    image: DecorationImage(
                        image: AssetImage("assets/images/icon-arrow-left-rounded.png"),fit: BoxFit.contain
                    )
                ),
              ),
            )),
      ],
    );
  }
}
