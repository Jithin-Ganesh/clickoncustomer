import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/img-provider.dart';

class RecentProductCard extends StatelessWidget {
  const RecentProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: 198,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                height: 225,
                width: 172,
                child: Center(
                  child: ImgProvider(
                    url: "assets/images/dummy/image-earing.png",
                    height: 225,
                    width: 172,
                  ),
                ),
                decoration: BoxDecoration(
                    color: canvasColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Positioned(
                top: 11,
                right: 11,
                child: IconButton(
                    onPressed: () {},
                    icon: ImgProvider(
                      url: "assets/images/icon-fav.png",radius: 12.5,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
