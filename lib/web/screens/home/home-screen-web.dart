import 'package:clickoncustomer/web/screens/home/web-carousel-slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/web-nav-bar.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(135),
          child: WebNavBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150.0,vertical: 60),
        child: ListView(
          children: [
              HomeCarouselSlider()
          ],
        ),
      ),
    );
  }
}
