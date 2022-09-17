import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/components/web/recently-viewed-product-card.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:flutter/cupertino.dart';

class RecentlyViewedProducts extends StatelessWidget {
  final List<Categories> recently;
  const RecentlyViewedProducts({Key? key, required this.recently})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
