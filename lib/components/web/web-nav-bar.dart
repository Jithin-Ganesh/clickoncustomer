import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../utils/constants/fontStyles/kanit.dart';



class WebNavBar extends StatelessWidget {
  const WebNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: canvasColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 160.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 14,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/clickOn-logo.png',
                        height: 37,
                        width: 60,
                      ),
                      Text(
                        'Click On Offers',
                        style: medium.copyWith(
                            fontSize: 12, color: webNavTitleColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Material(
                      elevation: 5.0,
                      shadowColor: Colors.grey,borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/searchIcon.png',
                                width: 13,
                                height: 13,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                           // border: InputBorder.none,
                            hintText: 'Search What are you looking for...',
                            filled: true,
                            hintStyle: thin,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'All',
                                    style: medium,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    'assets/images/icon-arrow-down.png',
                                    width: 8,
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40, width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: primaryColor,
                            ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add_location_alt_outlined,size: 22,color: canvasColor,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Deliver to',
                                style: thin.copyWith(
                                    color: productAvailabilityColor,fontSize: 14),
                              ),
                              Image.asset(
                                'assets/images/icon-arrow-down-outlined.png',
                                height: 5,
                                width: 10,
                              ),
                            ],
                          ),
                          Text(
                            'Ernakulam 682024',
                            style: medium,
                          )
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 1,
                    indent: 5,
                    endIndent: 5,
                    color: verticalDividerColor,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: primaryColor,
                         ),
                        child: Icon(Icons.person_outline,size: 22,color: canvasColor,),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome!',
                            style:
                                thin.copyWith(color: productAvailabilityColor),
                          ),
                          Row(
                            children: [
                              Text(
                                'Deliver to',
                                style: medium,
                              ),
                              Image.asset(
                                'assets/images/icon-arrow-down-outlined.png',
                                height: 5,
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 1,
                    indent: 5,
                    endIndent: 5,
                    color: verticalDividerColor,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon-heart-oulined.png',
                        height: 20,
                        width: 22,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Image.asset(
                        'assets/images/icon-cart.png',
                        height: 35,
                        width: 38,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        'Cart',
                        style: medium,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: horizontalDividerColor,thickness: 1,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Home',
                        style: medium.copyWith(
                            color: contactTitleColor, fontSize: 16),
                      ),
                      Text(
                        'Shop',
                        style: medium.copyWith(
                            color: subTextGeneralColor, fontSize: 16),
                      ),
                      Text(
                        'Offers',
                        style: medium.copyWith(
                            color: subTextGeneralColor, fontSize: 16),
                      ),
                      Text(
                        'Support',
                        style: medium.copyWith(
                            color: subTextGeneralColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 38,
                    width: 197,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: priceDetailsSubTextColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icon-tag.png',
                          height: 19,
                          width: 19,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Post an add',
                          style:
                              medium.copyWith(color: canvasColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 14,)
          ],
        ),
      ),
    );
  }
}
