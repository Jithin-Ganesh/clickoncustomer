import 'package:clickoncustomer/components/productDetailTitle.dart';
import 'package:clickoncustomer/components/similarProductItems.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/product-details/image-details.dart';
import 'package:clickoncustomer/screens/web/product-details/product-details.dart';
import 'package:clickoncustomer/screens/web/product-details/quetsion-and-answers.dart';
import 'package:clickoncustomer/screens/web/product-details/rating-and-reviews.dart';
import 'package:clickoncustomer/screens/web/product-details/specifications.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/custom-titlebar-with-viewall.dart';
import '../../../components/web/web-nav-bar.dart';

import '../../../utils/constants/fontstyles.dart';
import '../../../utils/img-provider.dart';
import '../home/products-for-you.dart';
import '../home/recently-viewed.dart';
import 'buy-together.dart';

class ProductDetailScreenWeb extends StatefulWidget {
  static const routeName = '/product-detail-web';
  const ProductDetailScreenWeb({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenWebState createState() => _ProductDetailScreenWebState();
}

class _ProductDetailScreenWebState extends State<ProductDetailScreenWeb> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet:  Container(
        child: Center(
          child: ImgProvider(
            url:  "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
      ),
      mobile: Container(
        child: Center(
          child: ImgProvider(
            url:  "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
      ),
      desktop: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(175), child: WebNavBar2()),
        backgroundColor: canvasColor,
        body: Consumer<CategoryProvider>(builder: (context, value, child) => SingleChildScrollView(
            child: Column(
              children: [
                ProductDetailTitle(),
                SizedBox(height: 80,),
                Row(
                  children: [
                    Flexible(flex: 1, child: ImageDetailsWeb()),
                    SizedBox(width: 80,),
                    Flexible(flex: 1, child: ProductDetails())
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                BuyTogether(),
                Specifications(specs: specs),
                SizedBox(height: 53,),
                RatingsAndReviews(),
                SizedBox(height: 54,),
                QuestionsAndAnswers(),
                SizedBox(height: 54,),
                Container(
                  color: bgColor.withOpacity(0.3),
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 160.0),
                        child: CustomTitleBarViewAll(title:   'Similar Products'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 160.0),
                        child: ProductsForYouList(),
                      ),
                      SizedBox(
                        height: 136,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 160.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Recently Viewed Products',style: medium.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.left,),
                            Text('View/Edit Browsing History',style: medium.copyWith(color: groupOrdersTitleTextColor),)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 160.0),
                        child: RecentlyViewedProducts(recently: value.recentlyAdded ?? []),
                      ),
                    ],
                  ),
                ),
                BottomWebBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
