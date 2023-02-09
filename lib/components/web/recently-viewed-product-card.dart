import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/img-provider-2.dart';
import '../../utils/img-provider.dart';

class RecentProductCard extends StatelessWidget {
  final String image;
  final int id;
  const RecentProductCard({Key? key, required this.image, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailScreenWeb.routeName,arguments: ProductDetailScreenWeb(productId: id,));
      },
      child: Container(
        height: 340,
        width: 198,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Center(
                  child: ImgProvider2(
                    url: image,
                    height: 225,
                    width: 172,radius: 10,
                  ),
                ),
                Positioned(
                  top: 11,
                  right: 11,
                  child: IconButton(
                      onPressed: () {},
                      icon: ImgProvider(
                        url: "assets/images/icon-fav.png",
                        radius: 12.5,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
