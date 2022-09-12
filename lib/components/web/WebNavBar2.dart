import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';

class WebNavBar2 extends StatelessWidget {
  const WebNavBar2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      backgroundColor: canvasColor,
      elevation: 2,
      leadingWidth: 400,
      leading: Column(
        children: [
          Image.asset(
            'assets/images/clickOn-logo.png',
            height: 37,
            width: 60,
          ),
          Text(
            'Click On Offers',
            style: medium.copyWith(fontSize: 12, color: webNavTitleColor),
          )
        ],
      ),
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(right: 71.0),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.45,
          child: Material(
            elevation: 3.0,
            shadowColor: shadowColor,
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              decoration: InputDecoration(prefixIconConstraints: BoxConstraints.tight(Size.fromWidth(13)),
                  prefixIcon: Image.asset(
                    'assets/images/searchIcon.png',
                    width: 13,
                    height: 13,
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
                      mainAxisSize: MainAxisSize.min,
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
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 160.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add_location_alt_outlined,
                        size: 22,
                        color: canvasColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Deliver to',
                            style: thin.copyWith(
                                color: productAvailabilityColor, fontSize: 14),
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
              SizedBox(
                width: 43,
              ),
              VerticalDivider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: verticalDividerColor,
              ),
              SizedBox(
                width: 49,
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
                    child: Icon(
                      Icons.person_outline,
                      size: 22,
                      color: canvasColor,
                    ),
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
                        style: thin.copyWith(color: productAvailabilityColor),
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
              SizedBox(
                width: 23,
              ),
              VerticalDivider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: verticalDividerColor,
              ),
              SizedBox(
                width: 36,
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
              ),
            ],
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160.0),
          child: Column(
            children: [
              Divider(
                color: horizontalDividerColor,
                thickness: 1,
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
                            style: medium.copyWith(
                                color: canvasColor, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
