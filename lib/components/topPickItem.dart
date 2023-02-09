
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants/fontStyles/kanit.dart';
import '../utils/img-provider-2.dart';
import '../utils/img-provider.dart';
import 'products.dart';

class TopPickItem extends StatefulWidget {
  const TopPickItem({super.key});

  @override
  State<TopPickItem> createState() => _TopPickItemState();
}

class _TopPickItemState extends State<TopPickItem> {
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
               // itemExtent: 185,
                itemCount: value.topPicks?.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TopPickBox(
                    height: 242,
                    image: value.topPicks?[index].image ?? "",
                    title: value.topPicks?[index].name ?? "",
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





class TopPickBox extends StatefulWidget {
  final double? height;
  final String image;
  final String title;
  const TopPickBox({Key? key, this.height, required this.image, required this.title}) : super(key: key);

  @override
  State<TopPickBox> createState() => _TopPickBoxState();
}

class _TopPickBoxState extends State<TopPickBox> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          ImgProvider2(
            url: widget.image,
            height: 210,radius: 10,
            width: MediaQuery.of(context).size.width * 0.096,
          ),
          const SizedBox(
            height: 9.7,
          ),
          Text(maxLines:2,
            widget.title,
            style: medium.copyWith(fontSize: 16,color: categoriesTextColor),
          )
        ],
      ),
    );
  }
}
