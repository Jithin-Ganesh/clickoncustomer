import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/constants/color.dart';
import '../utils/constants/fontstyles.dart';

class Reviews extends StatelessWidget {
  final String image;

  const Reviews({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 500,
        height: 700,
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                image,
                height: 256,
                width: 190,
              ),
              Positioned(
                //h
                bottom: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 13,
                    ),
                    Stack(children: [
                      Image.asset(
                        profilePicBgCircleImage,
                        height: 30,
                        width: 30,
                      ),
                      Positioned(
                        left: 8,
                        top: 5,
                        child: Image.asset(
                          profilePicImage,
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textCustomerNAme,
                          style: regular.copyWith(
                              fontSize: 12, color: loveButtonColor),
                        ),
                        RatingBar.builder(
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 12,
                          itemCount: 5,
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
          ],
        ),
      ),
    );
  }
}
