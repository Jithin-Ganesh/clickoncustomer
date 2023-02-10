import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/fontStyles/kanit.dart';

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
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const BottomWebBarItem(
                        image: "assets/images/icon-truck.png",
                        title: 'Worldwide shipping',
                        description:
                            'We ship to over 200 countries and regions world wide',
                        width: 64,
                        height: 40,
                      ),
                      const BottomWebBarItem(
                        image: "assets/images/icon-shield.png",
                        title: 'Secure Shopping',
                        description:
                            'Our Buyer Protection policy covers your entire purchase journey.',
                        height: 46.00,
                        width: 36,
                      ),
                      const BottomWebBarItem(
                        image: "assets/images/icon-chat.png",
                        title: 'Help center',
                        description:
                            '24x7 Support for a smooth shopping experience',
                        width: 55,
                        height: 50,
                      ),
                      const BottomWebBarItem(
                        image: "assets/images/icon-coupon.png",
                        title: 'Great Deals',
                        description: 'Get big savings on Exclusive Items',
                        width: 53,
                        height: 35,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  color: dividerColor2,
                ),
                const SizedBox(height: 80,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NEED HELP?',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: regular.copyWith(
                                  color: primaryColor, fontSize: 18),
                            ),
                            Text(
                              '(+91) 2340 056 789, (+91) 123 456',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: regular.copyWith(
                                  color: contactSubtextColor, fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const ImgProvider(
                              url: "assets/images/clickOn-logo.png",
                              height: 59,
                              width: 96,
                            ),
                            Text(
                              'Click On Offers',
                              style: regular.copyWith(
                                  color: clickOnOffersTitleColor, fontSize: 24),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Contact Us',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: regular.copyWith(
                                  color: primaryColor, fontSize: 18),
                            ),
                            Text(
                              'query@clickonoffers.com',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: regular.copyWith(
                                  color: contactSubtextColor, fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const About(),
        const Privacy()
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
                  border: Border.all(color: globeBorderColor)),
              child: Padding(
                padding: const EdgeInsets.only(left: 17,right: 13),
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
        color: bgColor.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 130.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const AboutItem(
                      content: [
                        'Cancellation & Return Policy',
                        'Track Order Status',
                        'FAQs',
                        'Terms of Use'
                      ],
                      title: 'Shop',
                    ),
                    const VerticalDivider(
                      width: 1,
                      color: verticalDividerColor2,
                    ),
                    const AboutItem(
                      content: ['Orders', 'Wishlist', 'Vouchers', 'Returns'],
                      title: 'My Account',
                    ),
                    const VerticalDivider(
                      width: 1,
                      color: verticalDividerColor2,
                    ),
                    const AboutItem(
                      content: [
                        'WhatsApp Us',
                        'Email Us',
                        'Call Us',
                        'Give Feedback'
                      ],
                      title: 'Support',
                    ),
                    const VerticalDivider(
                      width: 1,
                      color: verticalDividerColor2,
                    ),
                    const AboutItem(
                      content: [
                        'Company Info',
                        'Brand Identity',
                        'Careers',
                        'Newsroom'
                      ],
                      title: 'About Us ',
                    ),
                    const VerticalDivider(
                      width: 1,
                      color: verticalDividerColor2,
                    ),
                    const AboutItem(
                      content: ['Facebook', 'Twitter', 'Instagram'],
                      title: 'Connect with Us',
                    ),
                    const VerticalDivider(
                      width: 1,
                      color: verticalDividerColor2,
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enjoy Hustle Free Shop',
                            style:
                            regular.copyWith(fontSize: 18, color: Colors.black),
                          ),
                          const SizedBox(height: 32,),
                          Padding(
                              padding:  const EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                'Download the app Enjoy Fast',
                                style: thin.copyWith(fontSize: 14, color: Colors.black),
                              ),
                            ),
                          Padding(
                            padding:  const EdgeInsets.only(bottom: 15.0),
                            child: Text(
                              'hassle free Shopping',
                              style: thin.copyWith(fontSize: 14, color: Colors.black),
                            ),
                          ),
                           ImgProvider(url: 'assets/images/image-app-store.png',width: 246,height: 40,)

                        ],
                      ),
                    ),
                  ]),
              const Divider(
                height: 1,
                color: verticalDividerColor2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Shopfor: Mens Footwear  | Womens Footwear  |  Sarees  |  Casual Shoes  |  Mens Watches  |  Womens Casual Shoes  |  Frocks  |  Women Suits  |  Tops & Tunics  |  Gowns  |  Watches  |  ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: thin.copyWith(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 18,
                    width: 50,
                    decoration: BoxDecoration(
                        color: dropDownColor2,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Icon(Icons.keyboard_arrow_down_outlined),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class AboutItem extends StatelessWidget {
  final String title;
  final List<String> content;
  const AboutItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style:
                regular.copyWith(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 32,),
          ...content
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    e,
                    style: thin.copyWith(fontSize: 14, color: Colors.black),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
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
      width: MediaQuery.of(context).size.width * 0.16,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImgProvider(
            url: image,
            height: height,
            width: width,
          ),
          const SizedBox(
            width: 48,
          ),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: regular.copyWith(
                      fontSize: 18, color: additionalInfoTitleColor),
                ),
                const SizedBox(
                  height: 8,
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
