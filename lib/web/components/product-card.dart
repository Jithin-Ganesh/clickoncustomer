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
    return Container(
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
                    url: "assets/images/dummy/image-phone.png",
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
                  child: Text(
                    'On Sale',
                    style: medium.copyWith(fontSize: 12, color: bottomAppColor),
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
              Text(
                '16,999',
                style: thin.copyWith(fontSize: 17, color: ogPriceColor,decoration: TextDecoration.lineThrough),
              ),
            ],
          )
        ],
      ),
    );
  }
}
