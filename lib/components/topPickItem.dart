import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import 'products.dart';

class TopPickItem extends StatelessWidget {
  const TopPickItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 290, initialPage: 1,viewportFraction: 0.2,),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return const Products();
          },
        );
      }).toList(),
    );
  }
}
