import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/fontstyles.dart';
import '../../utils/image-provider.dart';

class ProductCard extends StatefulWidget {
 final ProductModel? product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailScreenWeb.routeName,arguments: ProductDetailScreenWeb(productId: widget.product?.id,));
      },
      child: Consumer<UserProvider>(builder: (context, value, child) => Container(
          height: 360,
          width: 198,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
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
                        url:  widget.product?.images ?? '',
                        boxFit: BoxFit.fill,
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
                        onPressed: () {
                          setState(() {
                            value.isWishListed(widget.product?.id)
                                ? value.deleteWishList(productId: widget.product?.id)
                                : value.addToWishList(productId: widget.product?.id);
                          });
                        },
                        icon: value.isWishListed(widget.product?.id)?ImgProvider(height: 28,width: 28,
                          url: "assets/images/love.png",
                        ):ImgProvider(height: 28,width: 28,
                          url: "assets/images/icon-fav.png",
                        )),
                  )
                ],
              ),
              SizedBox(height: 12,),
              Expanded(
                child: Text(
                  '${widget.product?.description}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: thin.copyWith(fontSize: 12, color: productSubTextColor),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${widget.product?.sellingPrice}',
                    style: regular.copyWith(fontSize: 17, color: primaryColor),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    '${widget.product?.mrpPrice}',
                    style: thin.copyWith(fontSize: 17, color: ogPriceColor,decoration: TextDecoration.lineThrough),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
