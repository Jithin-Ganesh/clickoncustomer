import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickoncustomer/web/components/recently-viewed-product-card.dart';
import 'package:flutter/cupertino.dart';

class RecentlyViewedProducts extends StatelessWidget {
   RecentlyViewedProducts({Key? key}) : super(key: key);
  final List<Widget> widgets = [
    RecentProductCard(),
    RecentProductCard(),
    RecentProductCard(),
    RecentProductCard(),
    RecentProductCard(),
    RecentProductCard(),
    RecentProductCard(),
    RecentProductCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: widgets,
      ),
    );
  }
}
