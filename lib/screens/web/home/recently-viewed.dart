import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/components/web/recently-viewed-product-card.dart';
import 'package:flutter/cupertino.dart';

class RecentlyViewedProducts extends StatelessWidget {
   RecentlyViewedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  CarouselSlider(
        options: CarouselOptions(height: 290, initialPage: 1,viewportFraction: 0.15,aspectRatio: 1),
        items: [1, 2, 3, 4, 5,6,7,8].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return const RecentProductCard();
            },
          );
        }).toList(),
      ),
      // child: Row(
      //   children: widgets,
      // ),
    );
  }
}
