import 'package:clickoncustomer/components/web/rating-box.dart';
import 'package:clickoncustomer/providers/cart-provider.dart';
import 'package:clickoncustomer/providers/product-provider.dart';
import 'package:clickoncustomer/screens/web/product-details/available-offers.dart';
import 'package:clickoncustomer/screens/web/product-details/buy-together.dart';
import 'package:clickoncustomer/screens/web/product-details/count-box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontStyles/kanit.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 160.0),
      child: Consumer<ProductProvider>(builder: (context, product, child) => Container(
          height: 620,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      product.productDetails?.product?.name ?? '',
                      maxLines: 2,
                      style: medium.copyWith(fontSize: 24),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                          height: 18,
                          width: 17,
                          child: Icon(Icons.share_outlined,color: productAvailabilityColor,)),
                      const SizedBox(
                        width: 21,
                      ),
                      Consumer<CartProvider>(builder: (context, value, child) => IconButton(
                          onPressed: () {
                            setState(() {
                              value.isWishListed(product.productDetails?.product?.id)
                                  ? value.deleteWishList(
                                  productId: product.productDetails?.product?.id)
                                  : value.addToWishList(
                                  productId: product.productDetails?.product?.id);
                            });
                          },
                          icon: value.isWishListed(product.productDetails?.product?.id)
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
                              : Container(
                            height: 31,
                            width: 30,
                            decoration:
                            const BoxDecoration(shape: BoxShape.circle,image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/icon-fav.png",
                                )
                            )),
                          )),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  const RatingBox(),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(
                    '138 Ratings & 8 Reviews',
                    style: regular.copyWith(
                        fontSize: 12, color: groupOrdersTitleTextColor),
                  )
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                'Brand: Pampers',
                style:
                    thin.copyWith(color: productAvailabilityColor, fontSize: 14),
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Clinically proven hypoallergenic',
                    style: thin.copyWith(
                        color: productAvailabilityColor, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Pampers Pure Protection Diapers are made without chlorine bleaching, fragrance, lotion, parabens, and EU 26 allergens',
                      style: thin.copyWith(
                          color: productAvailabilityColor, fontSize: 14),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      ' Made with premium cotton, soft plant-based fibers, and other thoughtfully selected materials',
                      style: thin.copyWith(
                          color: productAvailabilityColor, fontSize: 14,overflow: TextOverflow.ellipsis),maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Clinically proven hypoallergenic',
                    style: thin.copyWith(
                        color: productAvailabilityColor, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                'Choose Count',
                style: regular.copyWith(
                    color: productAvailabilityColor, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 41,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const CountBox(
                    count: '19',
                  ),
                  itemCount: 4,
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                'Available Offers',
                style: regular.copyWith(
                    color: productAvailabilityColor, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  height: 260,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const AvailableOffers(),
                      const AvailableOffers(),
                      const AvailableOffers(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
