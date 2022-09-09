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
            style:
                regular.copyWith(color: productAvailabilityColor, fontSize: 20),
          ),
          SizedBox(
            height: 38,
          ),
          Container(
            height: 165,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: specificationsColor),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: regular.copyWith(
                          fontSize: 20, color: productAvailabilityColor),
                    ),
                    SizedBox(
                      height: 9,
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
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 39.0,vertical: 33),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total no of Pieces',
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              '26',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'No of Diapers Per Pack',
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              '26',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
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
                              'Maximum Shelf Life' ,
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              '36 Months',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
                        Text(
                          'Manufacturing, Packaging and Import Info' ,
                          style: regular.copyWith(
                              fontSize: 14, color: primaryColor, decoration: TextDecoration.underline,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40,),
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
                    padding: const EdgeInsets.symmetric(horizontal: 39.0,vertical: 33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'General',
                          style: regular.copyWith(
                              fontSize: 20, color: productAvailabilityColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Model Number',
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              '80336834',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Target gender',
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Unisex',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Minimum Weight Recommendation' ,
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              '1 Kilograms',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Material' ,
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Cotton',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Style	' ,
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              'Medium',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Dimensions	' ,
                              style: thin.copyWith(
                                  fontSize: 14, color: priceDetailsSubTextColor),
                            ),
                            Text(
                              '11.4 x 23.6 x 21.7 cm; 693 Grams',
                              style: regular.copyWith(
                                  fontSize: 14, color: mainTitleColor),
                            ),
                            SizedBox(width: 1,),
                            SizedBox(width: 1,),
                          ],
                        ),
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
