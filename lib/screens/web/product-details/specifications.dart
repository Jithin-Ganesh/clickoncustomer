import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';

class Specifications extends StatelessWidget {
  final String specs;
  const Specifications({Key? key, required this.specs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Specifications',
            style: medium.copyWith(color: mainTitleColor, fontSize: 20),
          ),
          SizedBox(
            height: 28,
          ),
          Container(
            height: 165,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: specificationsColor),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, top: 29, right: 40, bottom: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: regular.copyWith(
                          fontSize: 20, color: productAvailabilityColor),
                    ),
                    SizedBox(
                      height: 8.4,
                    ),
                    Text(
                      specs,
                      style: thin.copyWith(fontSize: 14, color: mainTitleColor),
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 46,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 357,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: canvasColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:  MediaQuery.of(context).size.width * 0.0203, vertical: 33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'In The Box',
                          style: regular.copyWith(
                              fontSize: 20, color: productAvailabilityColor),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total no of Pieces',
                                  style: thin.copyWith(
                                      fontSize: 14,
                                      color: priceDetailsSubTextColor),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  'No of Diapers Per Pack',
                                  style: thin.copyWith(
                                      fontSize: 14,
                                      color: priceDetailsSubTextColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '26',
                                  style: regular.copyWith(
                                      fontSize: 14, color: mainTitleColor),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  '26',
                                  style: regular.copyWith(
                                      fontSize: 14, color: mainTitleColor),
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(
                          height: 1,
                          color: dividerColor,
                        ),
                        Text(
                          'Diaper Features',
                          style: regular.copyWith(
                              fontSize: 20, color: productAvailabilityColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Maximum Shelf Life',
                              style: thin.copyWith(
                                  fontSize: 14,
                                  color: priceDetailsSubTextColor),
                            ),
                            Text(
                              '36 Months',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                          ],
                        ),
                        Text(
                          'Manufacturing, Packaging and Import Info',
                          style: regular.copyWith(
                            fontSize: 14,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 357,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: canvasColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal:  MediaQuery.of(context).size.width * 0.0203, vertical: 33),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'General',
                              style: regular.copyWith(
                                  fontSize: 20,
                                  color: productAvailabilityColor),
                            ),
                            Text(
                              'Model Number',
                              style: thin.copyWith(
                                  fontSize: 14,
                                  color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Target gender',
                              style: thin.copyWith(
                                  fontSize: 14,
                                  color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Minimum Weight Recommendation',
                              style: thin.copyWith(
                                  fontSize: 14,
                                  color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Material',
                              style: thin.copyWith(
                                  fontSize: 14,
                                  color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Style	',
                              style: thin.copyWith(
                                  fontSize: 14,
                                  color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Product Dimensions	',
                              style: thin.copyWith(
                                  fontSize: 14,
                                  color: priceDetailsSubTextColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *  0.0286,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(),
                            Text(
                              '80336834',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            Text(
                              'Unisex',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            Text(
                              '1 Kilograms',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            Text(
                              'Cotton',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            Text(
                              'Medium',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            Text(
                              '11.4 x 23.6 x 21.7 cm',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
