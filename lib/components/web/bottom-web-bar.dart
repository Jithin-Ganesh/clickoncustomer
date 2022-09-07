import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomWebBar extends StatelessWidget {
  const BottomWebBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: canvasColor,
          height: 390,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomWebBarItem(
                      image: "assets/images/icon-truck.png",
                      title: 'Worldwide shipping',
                      description:
                          'We ship to over 200 countries and regions world wide',
                      width: 64,
                      height: 40,
                    ),
                    BottomWebBarItem(
                      image: "assets/images/icon-shield.png",
                      title: 'Secure Shopping',
                      description:
                          'Our Buyer Protection policy covers your entire purchase journey.',
                      height: 46.00,
                      width: 36,
                    ),
                    BottomWebBarItem(
                      image: "assets/images/icon-chat.png",
                      title: 'Help center',
                      description:
                          '24x7 Support for a smooth shopping experience',
                      width: 55,
                      height: 50,
                    ),
                    BottomWebBarItem(
                      image: "assets/images/icon-coupon.png",
                      title: 'Great Deals',
                      description: 'Get big savings on Exclusive Items',
                      width: 53,
                      height: 35,
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  color: dividerColor2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NEED HELP?',
                          style: regular.copyWith(
                              color: primaryColor, fontSize: 18),
                        ),
                        Text(
                          '(+91) 2340 056 789, (+91) 123 456',
                          style: regular.copyWith(
                              color: contactSubtextColor, fontSize: 24),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ImgProvider(
                          url: "assets/images/clickOn-logo.png",
                          height: 59,
                          width: 96,
                        ),
                        Text(
                          '(+91) 2340 056 789, (+91) 123 456',
                          style: regular.copyWith(
                              color: contactSubtextColor, fontSize: 24),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Contact Us',
                          style: regular.copyWith(
                              color: primaryColor, fontSize: 18),
                        ),
                        Text(
                          'query@clickonoffers.com',
                          style: regular.copyWith(
                              color: contactSubtextColor, fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        About(),
        Privacy()
      ],
    );
  }
}

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: canvasColor,
      height: 72,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 160.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 145,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: globeBorderColor)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      ImgProvider(url: "assets/images/icon-globe.png",height: 18,width: 18,),
                      Text('English',style: thin.copyWith(fontSize: 14,color: Colors.black),),
                  ImgProvider(url: "assets/images/icon-up-down.png",height: 12,width: 7,),
                ],
              ),
            ),
            Text('©️2010-2022 Click on Offers. All rights reserved. ',style: thin.copyWith(fontSize: 14,color: Colors.black),),
            Container(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Privacy Policy',style: thin.copyWith(fontSize: 14,color: Colors.black),),
                  Text('Legal Policy',style: thin.copyWith(fontSize: 14,color: Colors.black),),
                  Text('Sitemap',style: thin.copyWith(fontSize: 14,color: Colors.black),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 371,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: regular.copyWith(
                          fontSize: 18, color: additionalInfoTitleColor),
                    ),
                    Text(
                      'Cancellation & Return Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Track Order Status',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'FAQs',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Terms of Use',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 1,
                  color: verticalDividerColor2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: regular.copyWith(
                          fontSize: 18, color: additionalInfoTitleColor),
                    ),
                    Text(
                      'Cancellation & Return Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Track Order Status',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'FAQs',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Terms of Use',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 1,
                  color: verticalDividerColor2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: regular.copyWith(
                          fontSize: 18, color: additionalInfoTitleColor),
                    ),
                    Text(
                      'Cancellation & Return Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Track Order Status',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'FAQs',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Terms of Use',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 1,
                  color: verticalDividerColor2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: regular.copyWith(
                          fontSize: 18, color: additionalInfoTitleColor),
                    ),
                    Text(
                      'Cancellation & Return Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Track Order Status',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'FAQs',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Terms of Use',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 1,
                  color: verticalDividerColor2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: regular.copyWith(
                          fontSize: 18, color: additionalInfoTitleColor),
                    ),
                    Text(
                      'Cancellation & Return Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Track Order Status',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'FAQs',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Terms of Use',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 1,
                  color: verticalDividerColor2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style: regular.copyWith(
                          fontSize: 18, color: additionalInfoTitleColor),
                    ),
                    Text(
                      'Cancellation & Return Policy',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Track Order Status',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'FAQs',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Terms of Use',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ]),
              Divider(
                height: 1,
                color: verticalDividerColor2,
              ),
              Row(
                children: [
                  Text(
                    'Shopfor: Mens Footwear  |  Lehenga  |  Dresses  |  Womens Watches  |  Kurtis  |  Womens Footwear  |  Sarees  |  Casual Shoes  |  Mens Watches  |  Womens Casual Shoes  |  Frocks  |  Women Suits  |  Tops & Tunics  |  Gowns  |  Watches  |  ',
                    style: thin.copyWith(fontSize: 14, color: Colors.black),
                  ),
                  Container(
                    height: 18,
                    width: 50,
                    decoration: BoxDecoration(
                        color: dropDownColor2,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.keyboard_arrow_down_outlined),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class BottomWebBarItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double height;
  final double width;
  const BottomWebBarItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 194,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImgProvider(
            url: image,
            height: height,
            width: width,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  title,
                  style: regular.copyWith(
                      fontSize: 18, color: additionalInfoTitleColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    description,
                    style: thin.copyWith(
                      fontSize: 14,
                      color: additionalInfoSubtextColor,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
