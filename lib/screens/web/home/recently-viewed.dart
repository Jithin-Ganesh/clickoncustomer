import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/components/web/recently-viewed-product-card.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color.dart';

class RecentlyViewedProducts extends StatefulWidget {
  const RecentlyViewedProducts({Key? key})
      : super(key: key);

  @override
  State<RecentlyViewedProducts> createState() => _RecentlyViewedProductsState();
}

class _RecentlyViewedProductsState extends State<RecentlyViewedProducts> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<CategoryProvider>(builder: (context, value, child) => SizedBox(
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
                controller: _scrollController,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: RecentProductCard(image: value.recentProducts?[index].product?.thumbnail ?? '', id: value.recentProducts?[index].productId ?? 0,),
                    ),
                itemCount: value.recentProducts?.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              )),
        ),
        Positioned(
            top: 88,
            right:MediaQuery.of(context).size.width * 0.073,
            child: InkWell(
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.offset + 190,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              child: Container(
                height: 37,
                width: 37,
                decoration: const BoxDecoration(
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
                child: const Icon(Icons.keyboard_arrow_right_outlined),
              ),
            )),
        Positioned(
            top: 88,
            left: MediaQuery.of(context).size.width * 0.073,
            child: InkWell(
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.offset - 190,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                height: 37,
                width: 37,
                decoration: const BoxDecoration(
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
                ), child: const Icon(Icons.keyboard_arrow_left_outlined),
              ),
            )),
      ],
    );
  }
}
