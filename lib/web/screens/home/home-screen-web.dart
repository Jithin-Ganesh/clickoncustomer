import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/web/screens/home/best-selling.dart';
import 'package:clickoncustomer/web/screens/home/category-list.dart';
import 'package:clickoncustomer/web/screens/home/fashion-store.dart';
import 'package:clickoncustomer/web/screens/home/just-launched.dart';
import 'package:clickoncustomer/web/screens/home/products-for-you.dart';
import 'package:clickoncustomer/web/screens/home/tab-bar.dart';
import 'package:clickoncustomer/web/screens/home/web-carousel-slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/web-nav-bar.dart';
import 'group-orders.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  void initState() {
     Provider.of<CategoryProvider>(context, listen:  false).fetchCategory();
    // TODO: implement initState
    super.initState();
  }

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
              HomeBannerCarousel(),
            SizedBox(height: 55,),
            Consumer<CategoryProvider>(builder: (context, value, child) => HomeCategoryList(categories: value.categoriesList,)),
            SizedBox(height: 55,),
            Row(
              children: [
                Container(
                  height: 360,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: canvasColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF525BEB),
                              const Color(0xFF516BF7),
                             // const Color(0xFF4AA6FC),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 55,),
            GroupOrders(),
            SizedBox(height: 55,),
            Text('Best Selling Products',style: medium.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.center,),
            SizedBox(height: 12,),
            CustomTabBarView(),
            SizedBox(height: 55,),
            Text('Products For You',style: medium.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.left,),
            SizedBox(height: 12,),
            ProductsForYouList(),
            SizedBox(height: 55,),
            Text('Just Launched',style: medium.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.left,),
            SizedBox(height: 12,),
            JustLaunchedList(),
            SizedBox(height: 55,),
            Text('Best Selling',style: medium.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.left,),
            SizedBox(height: 12,),
            BestSelling(),
            SizedBox(height: 55,),
            Text('Fashion Store',style: medium.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.left,),
            SizedBox(height: 12,),
            FashionStore()
          ],
        ),
      ),
    );
  }
}
