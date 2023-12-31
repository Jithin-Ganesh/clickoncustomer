import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/models/top-picks.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProductsShimmerList extends StatefulWidget {
  const ProductsShimmerList({super.key});

  @override
  State<ProductsShimmerList> createState() => _ProductsShimmerListState();
}

class _ProductsShimmerListState extends State<ProductsShimmerList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Stack(
        children: [
          Consumer<CategoryProvider>(
            builder: (context, value, child) => SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.59,
              child: ListView.builder(
                itemExtent: 185,
                itemCount: value.topPicks?.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            'https://flutter'
                                '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Consumer<CategoryProvider>(
          //   builder: (context, value, child) =>
          //       CarouselSlider(
          //         carouselController: controller,
          //         options: CarouselOptions(
          //             height: 250,
          //             initialPage: 1,
          //             viewportFraction: 0.1,
          //             aspectRatio: 1),
          //         items: value.topPicks?.map((i) {
          //           return Builder(
          //             builder: (BuildContext context) {
          //               return Products(
          //                 height: 242,
          //                 image: i.image,
          //                 title: i.name ?? '',
          //               );
          //             },
          //           );
          //         }).toList(),
          //       ),
          // ),
          Positioned(
              top: 88,
              right: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 37,
                  width: 37,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: canvasColor
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
              left: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 37,
                  width: 37,
                  child: const Icon(Icons.keyboard_arrow_left_outlined),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: canvasColor
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
      ),
    );
  }
}
