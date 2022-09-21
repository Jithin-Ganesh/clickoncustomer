import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/constants/color.dart';

class RateYourExperience extends StatelessWidget {
  const RateYourExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top: 45),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImgProvider(
                url: "assets/images/img_35.png",
                width: 90,
                height: 71,
              ),
              SizedBox(
                width: 38,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textProduct,
                    style: medium.copyWith(
                        fontSize: 18, color: productDetailsScreenTotalColor),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    textYouOrderItemName,
                    style: regular.copyWith(
                        fontSize: 14, color: orderPlacedTextColor),
                  )
                ],
              ),
              SizedBox(
                width: 52,
              ),
              SizedBox(
                height: 71,
                child: VerticalDivider(
                  width: 3,
                  color: divColor,
                ),
              ),
              SizedBox(
                width: 63,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textSeller,
                    style: medium.copyWith(
                        fontSize: 18, color: productDetailsScreenTextColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textRKWorldPvtLtd,
                    style: medium.copyWith(fontSize: 24, color: primaryColor),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    textViewProfile,
                    style: regular.copyWith(
                        fontSize: 14,
                        color: priceDetailsSubTextColor,
                        decoration: TextDecoration.underline),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 327,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textRateSeller,
                      style: medium.copyWith(
                          fontSize: 18, color: productDetailsScreenTextColor),
                    ),
                    Text(
                      textFeedbackHelp,
                      style: medium.copyWith(
                          fontSize: 18, color: productDetailsScreenTextColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                RatingBar.builder(
                  glowRadius: 1.5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 38,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: ratingColor,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Text(
                      textItemDescribed,
                      style: medium.copyWith(
                          fontSize: 18, color: productDetailsScreenTextColor),
                    ),
                    SizedBox(
                      width: 78,
                    ),
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor),
                        splashRadius: 8,
                        value: false,
                        groupValue: false,
                        onChanged: (value) {
                          print(value);
                        }),
                    SizedBox(
                      width: 11,
                    ),
                    Text(
                      textYes,
                      style: medium.copyWith(
                          fontSize: 14, color: subTextGeneralColor),
                    ),
                    SizedBox(
                      width: 29,
                    ),
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor),
                        splashRadius: 8,
                        value: true,
                        groupValue: false,
                        onChanged: (value) {
                          print(value);
                        }),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      textNo,
                      style: medium.copyWith(
                          fontSize: 14, color: subTextGeneralColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Text(textYourComments,
                    style: medium.copyWith(
                      fontSize: 14,
                      color: subTextGeneralColor,
                    )),
                SizedBox(
                  height: 1,
                ),
                Text(
                  textPleaseComment,
                  style: regular.copyWith(fontSize: 14, color: commentColor),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10),color: textFieldColor),
                    width: 971,
                    height: 85,
                    child: TextFormField()),
                SizedBox(
                  height: 22,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        textSubmit,
                        style:
                            regular.copyWith(fontSize: 14, color: Colors.white),
                      )),
                )
              ],
            )),
      )
    ]));
  }
}
