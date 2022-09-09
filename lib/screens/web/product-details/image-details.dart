import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';

class ImageDetailsWebItem extends StatelessWidget {
  const ImageDetailsWebItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.5),
              child: ImgProvider(url: "assets/images/dummy/image-baby-small.png",height: 80,width: 80,),
            ),itemCount: 5,),
        ),
        Container(
                child: ImgProvider(
                  url: "assets/images/dummy/image-baby-detail.png",
                  height: 410,
                  width: 410,
                ),
        )
      ],
    );
  }
}


class ImageDetailsWeb extends StatelessWidget {
  const ImageDetailsWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 620,
      child: ContainedTabBarView(
        tabs: [
          Text('Images (5)'),
          Text('Videos (1)'),
        ],tabBarProperties: TabBarProperties(
        height: 32.0,
        indicatorColor: Colors.transparent,
        indicatorWeight: 6.0,
        labelColor: Colors.black,labelStyle: regular.copyWith(fontSize: 16),
        unselectedLabelColor: mainTitleColor,
      ),
        views: [
          ImageDetailsWebItem(),
          ImageDetailsWebItem(),
        ],
      ),
    );
  }
}
