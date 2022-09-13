import 'package:clickoncustomer/components/youritems_item.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/fontstyles.dart';

class CartTabBarItem extends StatelessWidget {
  CartTabBarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            mainAxisExtent: 446
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return YourItems();
          },
        ),
      ),
    );
  }
}


class CartTabBar extends StatelessWidget {
  const CartTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 720,
      child: ContainedTabBarView(
        tabs: [
          Text('Saved for later'),
          Text('Buy it again'),
          Text('Move from wishlist'),
        ],
        tabBarProperties: TabBarProperties(
          height: 32.0,isScrollable: true,
          indicatorColor: primaryColor,
          indicatorWeight: 3.0,
          labelPadding: EdgeInsets.only(right: 37),
          indicatorPadding: EdgeInsets.only(top: 15,right: 37,),
          labelColor: Colors.black,
          labelStyle: regular.copyWith(color: primaryColor),
          unselectedLabelColor: Colors.black,
        ),
        views: [
          CartTabBarItem(),
          CartTabBarItem(),
          CartTabBarItem(),
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}
