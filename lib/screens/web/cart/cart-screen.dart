import 'package:clickoncustomer/components/web/custom-title-bar.dart';
import 'package:clickoncustomer/components/web/zig-zag-sheet.dart';
import 'package:clickoncustomer/components/yourcart.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/cart/cart-tab-bar.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/custom-titlebar-with-viewall.dart';
import '../../../models/cart.dart';
import '../../../providers/cart-provider.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';
import '../../../utils/img-provider.dart';
import '../home/products-for-you.dart';
import '../home/recently-viewed.dart';

class CartScreenWeb extends StatefulWidget {
  static const routeName = '/cart-screen-web';
  const CartScreenWeb({Key? key}) : super(key: key);

  @override
  _CartScreenWebState createState() => _CartScreenWebState();
}

class _CartScreenWebState extends State<CartScreenWeb> {
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
        body: FutureBuilder(
          future: Provider.of<CartProvider>(context, listen: false).fetchCart(),
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
                final cart = snapshot.data as Cart;
                return CartBody(
                );
              }
            }
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.90,
              child: Center(child: Text('Cart is empty',style: Theme
                  .of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: accentColor,fontSize: 18),)),
            );
          },
        ),
      ),
    );
  }
}

class CartBody extends StatelessWidget {
  const CartBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 91,
                  ),
              Consumer<CartProvider>(builder: (context, value, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 38.0),
                                child: const CustomTitleBar(
                                    title: 'Your Cart', isShop: true),
                              ),
                              SizedBox(
                                height: 180,
                                child: ListView.builder(
                                  itemBuilder: (context, index) => YourCart(
                                      product: value.cart?.cartProducts?[index],cartId: value.cart?.id,),
                                  itemCount: value.cart?.cartProducts?.length,
                                ),
                              )
                            ],
                          ),

                      ),
                       SizedBox(width: 30,),
                       ZigZagSheet(
                        isCoupon: false
                      ),
                    ],
                  ),),
                  const SizedBox(
                    height: 118,
                  ),
                  const CustomTitleBar(
                    title: 'Your Items',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const CartTabBar(),
                  const SizedBox(
                    height: 91,
                  ),
                  const CustomTitleBarViewAll(title: 'Explore more items'),
                  const SizedBox(
                    height: 31,
                  ),
                  const ProductsForYouList(),
                  const SizedBox(
                    height: 60,
                  ),
                  const Divider(
                    color: horizontalDividerColor,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently Viewed Products',
                        style:
                            medium.copyWith(color: Colors.black, fontSize: 28),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'View/Edit Browsing History',
                        style:
                            medium.copyWith(color: groupOrdersTitleTextColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RecentlyViewedProducts(recently: value.recentlyAdded ?? []),
                  const SizedBox(
                    height: 106,
                  )
                ],
              ),
            ),
            const BottomWebBar()
          ],
        ),
      ),
    );
  }
}
