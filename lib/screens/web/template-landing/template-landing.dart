import 'package:clickoncustomer/components/web/template-landing-appbar.dart';
import 'package:clickoncustomer/screens/web/template-landing/template-landing-product-screen.dart';
import 'package:clickoncustomer/utils/constants/fontStyles/kanit.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/tab-bar-view-component.dart';
import '../../../components/tab-bar-view-sub.dart';
import '../../../components/template-landing-carousel.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/img-provider.dart';
import '../home/home-screen-web.dart';

class TemplateLanding extends StatelessWidget {
  static const routeName = '/template-screen-web';
  const TemplateLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: Container(
        child: const Center(
          child: ImgProvider(
            url: "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
      ),
      mobile: Container(
        child: const Center(
          child: ImgProvider(
            url: "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
      ),
      desktop: Scaffold(
        backgroundColor: bgColor.withOpacity(0.3),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(103),
            child: TemplateLandingAppbar()),
        body: const TemplateLandingScreen(),
      ),
    );
  }
}

class TemplateLandingScreen extends StatefulWidget {
  const TemplateLandingScreen({Key? key}) : super(key: key);

  @override
  State<TemplateLandingScreen> createState() => _TemplateLandingScreenState();
}

class _TemplateLandingScreenState extends State<TemplateLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TemplateLandingCarousel(),
          Container(
            color: templateMultiCartContainerColor,
            width: 1920,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ContainedTabBarView(
                  tabBarProperties: TabBarProperties(
                    background: Container(
                      width: 1920,
                      height: 80,
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
          )
        ],
      ),
    );
  }
}
