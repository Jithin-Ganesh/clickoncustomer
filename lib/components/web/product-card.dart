import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? image;

  const ProductCard({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailScreenWeb.routeName);
      },
      child: Container(
        height: 340,
        width: 198,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: 257,
                  width: 198,
                  child: Center(
                    child: ImgProvider(
                      url: image ?? '',
                      height: 147,
                      width: 114,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: canvasColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 23,
                    width: 76,
                    child: Center(
                      child: Text(
                        'On Sale',
                        style: medium.copyWith(fontSize: 12, color: bottomAppColor,),textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: onSaleColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                ),
                Positioned(
                  top: 11,
                  right: 11,
                  child: IconButton(
                      onPressed: () {},
                      icon: ImgProvider(
                        url: "assets/images/icon-fav.png",
                      )),
                )
              ],
            ),
            Expanded(
              child: Text(
                'Pampers Pure Protection Baby Diapers, Medium Size... ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: thin.copyWith(fontSize: 12, color: productSubTextColor),
              ),
            ),
            Row(
              children: [
                Text(
                  '14,999',
                  style: regular.copyWith(fontSize: 17, color: primaryColor),
                ),
                SizedBox(width: 8,),
                Text(
                  '16,999',
                  style: thin.copyWith(fontSize: 17, color: ogPriceColor,decoration: TextDecoration.lineThrough),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
