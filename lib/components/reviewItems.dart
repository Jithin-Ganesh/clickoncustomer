import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/constants/color.dart';
import '../utils/constants/fontstyles.dart';

class ReviewItem extends StatelessWidget {
  final String image;

  const ReviewItem({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: 256,
      child: Stack(children: [
        Image.asset(
          image,
          height: 256,
          width: 190,
        ),
        Positioned(
          //h
          bottom: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 13,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: primaryColor,
                ),
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 15,
                  color: canvasColor,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textCustomerNAme,
                    style: regular.copyWith(
                        fontSize: 14, color: Colors.white),
                  ),
                  RatingBar.builder(
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 12,
                    itemCount: 5,initialRating: 5,
                    itemPadding:
                    const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ratingColor,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
