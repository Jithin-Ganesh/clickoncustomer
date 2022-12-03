import 'dart:developer';

import 'package:clickoncustomer/components/productDetailTitle.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/product-details/image-details.dart';
import 'package:clickoncustomer/screens/web/product-details/product-details.dart';
import 'package:clickoncustomer/screens/web/product-details/quetsion-and-answers.dart';
import 'package:clickoncustomer/screens/web/product-details/rating-and-reviews.dart';
import 'package:clickoncustomer/screens/web/product-details/specifications.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/custom-titlebar-with-viewall.dart';
import '../../../models/product-detail-model.dart';
import '../../../providers/product-provider.dart';
import '../../../utils/constants/fontstyles.dart';
import '../../../utils/img-provider.dart';
import '../home/products-for-you.dart';
import 'buy-together.dart';

class ProductDetailScreenWeb extends StatefulWidget {
  static const routeName = '/product-detail-web';
  const ProductDetailScreenWeb({Key? key, this.productId}) : super(key: key);
  final int? productId;
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
  ProductDetailScreenWeb _args() {
    final args =
    ModalRoute.of(context)!.settings.arguments as ProductDetailScreenWeb;
    return args;
  }



  Future<ProductDetailModel?> _future() async {
    return await Provider.of<ProductProvider>(context, listen: false)
        .fetchProductDetails(productId: _args().productId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet:  const Center(
        child: ImgProvider(
          url:  "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      mobile: const Center(
        child: ImgProvider(
          url:  "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      desktop: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(175), child: WebNavBar2()),
        backgroundColor: canvasColor,
        body: FutureBuilder(
          future: _future(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 15,
                ),
              );
            } else {
              if (snapshot.hasData) {
                log('received args product id ${_args().productId}');
                final productDetails = snapshot.data as ProductDetailModel;
                return ProductDetailComponent(product: productDetails,);
              }
            }
            return Text(
              snapshot.error.toString(),
            );
          },
        ),
        ),
      );

  }
}

class ProductDetailComponent extends StatefulWidget {
  final ProductDetailModel product;
  const ProductDetailComponent({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailComponent> createState() => _ProductDetailComponentState();
}

class _ProductDetailComponentState extends State<ProductDetailComponent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductDetailTitle(productId: widget.product.product?.id),
          const SizedBox(height: 80,),
          Row(
            children:  [
              Flexible(flex: 1, child: ImageDetailsWeb(productModel: widget.product.product,)),
              SizedBox(width: 80,),
              Flexible(flex: 1, child: ProductDetails())
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const BuyTogether(),
          Specifications(specs: specs),
          const SizedBox(height: 54,),
          const RatingsAndReviews(),
          const SizedBox(height: 54,),
          const QuestionsAndAnswers(),
          const SizedBox(height: 54,),
          Container(
            color: bgColor.withOpacity(0.3),
            child: Column(
              children: [
                const SizedBox(height: 60,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 160.0),
                  child: CustomTitleBarViewAll(title:   'Similar Products'),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 160.0),
                  child: ProductsForYouList(),
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 12,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 160.0),
                //   child: RecentlyViewedProducts(recently: value.recentlyAdded ?? []),
                // ),
              ],
            ),
          ),
          const BottomWebBar()
        ],
      ),
    );
  }
}
