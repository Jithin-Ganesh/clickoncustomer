import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/img-provider-2.dart';

import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart-provider.dart';
import '../../utils/constants/fontStyles/kanit.dart';
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
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreenWeb.routeName,
            arguments: ProductDetailScreenWeb(
              productId: widget.product?.id,
            ));
      },
      child: Consumer<CartProvider>(
        builder: (context, value, child) => Container(
          height: 360,
          width: 198,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: ImgProvider(
                      radius: 10,
                      url: widget.product?.thumbnail ?? '',
                      boxFit: BoxFit.fill,
                      height: 257,
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
                          style: medium.copyWith(
                            fontSize: 12,
                            color: bottomAppColor,
                          ),
                          textAlign: TextAlign.center,
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
                                ? value.deleteWishList(
                                    productId: widget.product?.id)
                                : value.addToWishList(
                                    productId: widget.product?.id);
                          });
                        },
                        icon: value.isWishListed(widget.product?.id)
                            ? Container(
                                height: 31,
                                width: 30,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle
                                    ,image: DecorationImage(
                                          image: AssetImage(
                                           "assets/images/love.png",
                                          )
                                        )),
                              )
                            : const ImgProvider2(url: "assets/images/icon-fav.png",height: 31,width: 30,radius: 50,)),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Text(
                  '${widget.product?.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      thin.copyWith(fontSize: 12, color: productSubTextColor),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${widget.product?.sellingPrice}',
                    style: regular.copyWith(fontSize: 17, color: primaryColor),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${widget.product?.mrpPrice}',
                    style: thin.copyWith(
                        fontSize: 17,
                        color: ogPriceColor,
                        decoration: TextDecoration.lineThrough),
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
