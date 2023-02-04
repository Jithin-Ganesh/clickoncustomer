import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

import '../../utils/constants/fontStyles/kanit.dart';
import '../../utils/img-provider.dart';

class BottomWebBar2 extends StatelessWidget {
  const BottomWebBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: canvasColor,
      height: 72,
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: verticalDividerColor2,
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 145,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: globeBorderColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ImgProvider(
                      url: "assets/images/icon-globe.png",
                      height: 18,
                      width: 18,
                    ),
                    Text(
                      'English',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    const ImgProvider(
                      url: "assets/images/icon-up-down.png",
                      height: 12,
                      width: 7,
                    ),
                  ],
                ),
              ),
              Text(
                '©️2010-2022 Click on Offers. All rights reserved. ',
                style: thin.copyWith(fontSize: 14, color: Colors.black),
              ),
              Container(
                width: 230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Legal Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Sitemap',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}