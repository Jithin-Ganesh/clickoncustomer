import 'package:clickoncustomer/providers/auth.dart';
import 'package:clickoncustomer/screens/web/account-order/account-order-screen.dart';
import 'package:clickoncustomer/screens/web/profile/profile-screen.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/account_subcomponent.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/bottom-web-bar-2.dart';
import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/custom-alert-box.dart';
import '../../../components/web/custom-title-bar.dart';
import '../../../components/youritems_item.dart';
import '../../../models/cart.dart';
import '../../../models/product-model.dart';
import '../../../providers/cart-provider.dart';
import '../../../providers/user-provider.dart';
import '../../../utils/constants/color.dart';

import '../../../utils/constants/fontStyles/kanit.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/img-provider.dart';
import '../../../utils/pref_utils.dart';
import '../../login_screen.dart';
import '../home/web-carousel-slider.dart';

class WishListScreen extends StatefulWidget {
  static const routeName = '/wishlist';
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    const double itemHeight = 130;
    final double itemWidth = MediaQuery.of(context).size.width * 0.1989;
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
        body: FutureBuilder(
          future:
              Provider.of<CartProvider>(context, listen: false).getWishlist(),
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
                final products = snapshot.data as List<GetWishList>;
                return WishListBody();
              }
            }
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.90,
              child: Center(
                  child: Text(
                'WishList is empty',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: accentColor, fontSize: 18),
              )),
            );
          },
        ),
      ),
    );
  }
}

class WishListBody extends StatelessWidget {
  const WishListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 160.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [ SizedBox(height: 25,),
                const Padding(
                  padding: EdgeInsets.only(right: 38.0),
                  child: CustomTitleBar(title: 'WishList', isShop: false),
                ),
                SizedBox(height: 25,),
                Consumer<CartProvider>(
                  builder: (context, value, child) => Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 8,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          mainAxisExtent: 446),
                      itemCount: value.wishList.length,
                      itemBuilder: (context, index) {
                        return YourItems(wishListId: value.wishList[index].id,
                          product: value.wishList[index].productModel,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const BottomWebBar()
        ],
      ),
    );
  }
}

class ImageIndicators2 extends StatelessWidget {
  const ImageIndicators2({
    Key? key,
    required this.currentPage,
    required this.index,
  }) : super(key: key);

  final int currentPage;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
      ),
    );
  }
}
