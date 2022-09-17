import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/img-provider.dart';

class YourAccountWeb extends StatefulWidget {
  static const routeName = '/your-account-web';
  const YourAccountWeb({Key? key}) : super(key: key);

  @override
  _YourAccountWebState createState() => _YourAccountWebState();
}

class _YourAccountWebState extends State<YourAccountWeb> {
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
            preferredSize: Size.fromHeight(175), child:  WebNavBar2()),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter, colors: [
                primaryColor.withOpacity(.16),
                gradiant2,
              ])),
          ),
        ),
    );
  }
}
