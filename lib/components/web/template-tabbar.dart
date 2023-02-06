import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/web/template-landing/template-landing-product-screen.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/fontStyles/kanit.dart';
import '../tab-bar-view-component.dart';
import '../tab-bar-view-sub.dart';

class TemplateTabBar extends StatelessWidget {
  const TemplateTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: templateMultiCartContainerColor,
      width: 1920,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ContainedTabBarView(
            tabBarViewProperties: const TabBarViewProperties(
                physics: NeverScrollableScrollPhysics()),
            tabBarProperties: TabBarProperties(
              background: Container(
                color: templateMultiCartContainerColor,
              ),
              width: 1000,
              height: 32.0,
              isScrollable: true,
              indicatorColor: primaryColor,
              indicatorWeight: 3.0,
              labelPadding: const EdgeInsets.only(right: 47),
              indicatorPadding: const EdgeInsets.only(
                top: 15,
                right: 37,
              ),
              labelColor: Colors.black,
              labelStyle: sansRegular.copyWith(color: primaryColor),
              unselectedLabelColor: Colors.black,
            ),
            tabs: const [
              TabBarViewItem(
                image: 'assets/images/dummy/home.png',
                text: 'Home',
              ),
              TabBarViewSub(
                image: "assets/images/dummy/product.png",
                text: 'products',
              ),
              TabBarViewSub(
                image: "assets/images/dummy/scooter.png",
                text: 'Delivery',
              ),
              TabBarViewSub(
                image: "assets/images/dummy/refund.png",
                text: 'Refund Policy',
              ),
              TabBarViewSub(
                image: "assets/images/dummy/contact.png",
                text: 'Contact',
              ),
              TabBarViewSub(
                image: "assets/images/dummy/terms.png",
                text: 'Terms & Conditions',
              ),
            ],
            views: const [
              TemplateLandingProduct(),
              TemplateLandingProduct(),
              TemplateLandingProduct(),
              TemplateLandingProduct(),
              TemplateLandingProduct(),
              TemplateLandingProduct(),
            ]),
      ),
    );
  }
}
