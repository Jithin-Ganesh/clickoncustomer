import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  TabBarItem({Key? key}) : super(key: key);
  final List<Widget> images = [
   HomeProductBox(width: 275,
       height: 325, image: 'assets/images/dummy/image-xbox.png'),
    HomeProductBox(width: 275,
        height: 325, image: 'assets/images/dummy/image-2.png'),
    HomeProductBox(width:700,
        height: 325, image: 'assets/images/dummy/image-4.png'),
    HomeProductBox(width: 275,
        height: 325, image: 'assets/images/dummy/image-3.png'),
    HomeProductBox(width: 275,
        height: 325, image: 'assets/images/dummy/image-6.png'),
    HomeProductBox(width:700,
        height: 325, image: 'assets/images/dummy/image-4.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        children: images,
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720,
      child: ContainedTabBarView(
        tabs: [
          Text('Tech'),
          Text('Vehicles'),
          Text('Sports'),
          Text('Kids & Toy'),
          Text('Fashion'),
          Text('Appliances'),
        ],
        tabBarProperties: TabBarProperties(
          height: 32.0,
          indicatorColor: Colors.transparent,
          indicatorWeight: 6.0,
          labelColor: Colors.black,
          labelStyle: regular,
          unselectedLabelColor: Colors.black,
        ),
        views: [
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}