import 'package:clickoncustomer/components/rate_your_experience_component.dart';
import 'package:clickoncustomer/components/web/WebNavBar2.dart';
import 'package:clickoncustomer/components/web/account-title-bar.dart';
import 'package:clickoncustomer/components/web/bottom-web-bar-2.dart';
import 'package:clickoncustomer/providers/product-provider.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../utils/constants/color.dart';

class RateYourExperienceScreen extends StatefulWidget {
  static const routeName = '/rate-experience';
  const RateYourExperienceScreen({Key? key, this.productId}) : super(key: key);
  final int? productId;

  @override
  State<RateYourExperienceScreen> createState() =>
      _RateYourExperienceScreenState();
}

class _RateYourExperienceScreenState extends State<RateYourExperienceScreen> {
  RateYourExperienceScreen _args() {
    final args =
        ModalRoute.of(context)!.settings.arguments as RateYourExperienceScreen;
    return args;
  }

  final TextEditingController textController = TextEditingController();
  late double ratingValue;
  @override
  Widget build(BuildContext context) {
    return Responsive(
        tablet: const Center(
          child: ImgProvider(
            url: "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
        mobile: const Center(
          child: ImgProvider(
            url: "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
        desktop: Scaffold(
          backgroundColor: bgColor2,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(175), child: WebNavBar2()),
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  primaryColor.withOpacity(.16),
                  gradiant2,
                ])),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.187),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 61,
                      ),
                      const AccountTitleBar(
                        title: 'Rate your experience',
                        subTitle: 'Your Orders',
                      ),
                      const SizedBox(
                        height: 57,
                      ),
                      RateYourExperienceComponent(productId: _args().productId,)
                    ],
                  ),
                ),
                SizedBox(
                  height: 306,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.083),
                  child: const BottomWebBar2(),
                )
              ]),
            ),
          ),
        ));
  }
}
