import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
 final ProductModel? product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailScreenWeb.routeName,arguments: ProductDetailScreenWeb(productId: product?.id,));
      },
      child: Container(
        height: 360,
        width: 198,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: 257,
                  width: 198,
                  decoration: BoxDecoration(
                      color: canvasColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: ImgProvider(
                      url: product?.image ?? '',
                      height: 147,
                      width: 114,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 23,
                    width: 76,
                    decoration: const BoxDecoration(
                        color: onSaleColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Center(
                      child: Text(
                        'On Sale',
                        style: medium.copyWith(fontSize: 12, color: bottomAppColor,),textAlign: TextAlign.center,
                      ),
                    ),
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
            SizedBox(height: 12,),
            Expanded(
              child: Text(
                '${product?.description}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: thin.copyWith(fontSize: 12, color: productSubTextColor),
              ),
            ),
            Row(
              children: [
                Text(
                  '${product?.price}',
                  style: regular.copyWith(fontSize: 17, color: primaryColor),
                ),
                SizedBox(width: 8,),
                Text(
                  '${product?.price}',
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
