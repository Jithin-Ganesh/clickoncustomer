import 'dart:developer';

import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/fontStyles/kanit.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      HomeProductBox(
          width: MediaQuery.of(context).size.width * 0.143,
          height: 327,
          image: 'assets/images/dummy/image-xbox.png'),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.015,
      ),
      HomeProductBox(
          width: MediaQuery.of(context).size.width * 0.353,
          height: 327,
          image: 'assets/images/dummy/image-4.png'),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.015,
      ),
      HomeProductBox(
          width: MediaQuery.of(context).size.width * 0.143,
          height: 327,
          image: 'assets/images/dummy/image-2.png'),
    ];
    final List<Widget> images2 = [
      HomeProductBox(
          width: MediaQuery.of(context).size.width * 0.143,
          height: 327,
          image: 'assets/images/dummy/image-3.png'),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.015,
      ),
      HomeProductBox(
          width: MediaQuery.of(context).size.width * 0.143,
          height: 327,
          image: 'assets/images/dummy/image-6.png'),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.015,
      ),
      HomeProductBox(
          width: MediaQuery.of(context).size.width * 0.353,
          height: 327,
          image: 'assets/images/dummy/image-4.png'),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images2,
          )
        ],
      ),
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: ContainedTabBarView(
        tabs: const [
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
            labelColor: primaryColor,
            labelStyle: regular.copyWith(fontSize: 18),
            unselectedLabelColor: Colors.black,
            alignment: TabBarAlignment.center,
            width: 1000),
        views: const [
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
        ],
        onChange: (index) => log(index.toString()),
      ),
    );
  }
}
