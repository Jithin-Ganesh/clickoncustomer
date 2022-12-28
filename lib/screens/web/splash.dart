import 'dart:async';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';
import '../../utils/constants/decoration.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {

    // // TODO: implement initState
    Future.delayed(
      const Duration(seconds: 2),
          () async {
        init();
      },
    );

    super.initState();
  }


  init() async {

    Future.delayed(
      Duration(milliseconds: 2),
          () async {
        await Provider.of<AuthProvider>(context, listen: false).init();
      },
    );


    Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreenWeb.routeName, (route) => false);

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: const ImgProvider(
            url: "assets/images/clickOn-logo.png",
            width: 200,
            height: 100,
          ),
        ),
      ),
    );
  }
}
