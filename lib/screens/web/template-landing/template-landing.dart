import 'package:clickoncustomer/components/web/template-landing-appbar.dart';
import 'package:clickoncustomer/components/web/template-tabbar.dart';
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

class TemplateLanding extends StatefulWidget {
  static const routeName = '/template-screen-web';
  const TemplateLanding({Key? key}) : super(key: key);

  @override
  State<TemplateLanding> createState() => _TemplateLandingState();
}

class _TemplateLandingState extends State<TemplateLanding> {
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
        children: const [
          TemplateLandingCarousel(),
          TemplateTabBar(),
        ],
      ),
    );
  }
}
