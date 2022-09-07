import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
   TabBarItem({Key? key}) : super(key: key);
final List<Widget> images = [
  Image.asset("assets/images/dummy/image-1.png",width: 275,height: 325,),
  Image.asset("assets/images/dummy/image-2.png",height: 326,),
  Image.asset("assets/images/dummy/image-4.png",height: 325,),
  Image.asset("assets/images/dummy/image-3.png",height: 325,),
  Image.asset("assets/images/dummy/image-5.png",height: 325,),
  Image.asset("assets/images/dummy/image-6.png",height: 325,),

];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(spacing: 30,runSpacing: 30,
          children: images
          ,
        ) ,
    );
  }
}


class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child:  ContainedTabBarView(
        tabs: [
          Text('Tech'),
          Text('Vehicles'),
          Text('Sports'),
          Text('Kids & Toy'),
          Text('Fashion'),
          Text('Appliances'),
        ],tabBarProperties: TabBarProperties(
        height: 32.0,
        indicatorColor: Colors.transparent,
        indicatorWeight: 6.0,
        labelColor: Colors.black,labelStyle: regular,
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
