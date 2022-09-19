import 'package:clickoncustomer/components/reviewItems.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';

class RatingsAndReviews extends StatelessWidget {
  const RatingsAndReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.083,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Ratings(), Reviews()],
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Picture & Video Reviews',
                style: medium.copyWith(color: mainTitleColor, fontSize: 24),
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Text(
                    'Share your thoughts with other customers',
                    style:
                        regular.copyWith(color: reviewTextColor, fontSize: 14),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: productDetailsScreenBoxColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Review Product',
                      style:
                          medium.copyWith(color: mainTitleColor, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 60,),
          Container(
            height: 260,
            width: MediaQuery.of(context).size.width * 0.6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  ReviewItem(image: 'assets/images/dummy/image-review.png'),
              itemCount: 3,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'See all reviews',
                style: regular.copyWith(
                    color: reviewTextColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ReviewBox(
              name: 'Saskia',
              title: 'Just the best having disposable tape on it',
              description: desc),
          SizedBox(
            height: 15,
          ),
          ReviewBox(
              name: 'Verified Customer',
              title: 'Good diaper but expensive',
              description: desc2),
        ],
      ),
    );
  }
}

class ReviewBox extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  const ReviewBox(
      {Key? key,
      required this.name,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 301,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: bgColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: primaryColor,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: 22,
                        color: canvasColor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      name,
                      style: regular.copyWith(
                        color: productAvailabilityColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '42 people found this helpful',maxLines: 1,
                      style: regular.copyWith(overflow: TextOverflow.ellipsis,
                        color: productAvailabilityColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 12,),
            Text(
              title,
              style: medium.copyWith(color: mainTitleColor, fontSize: 16),
            ),
            SizedBox(height: 3,),
            Row(
              children: [
                RatingBar.builder(
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 12,
                  itemCount: 5,
                  initialRating: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: ratingColor2,
                    size: 20,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Reviewed on 1 January 2019',
                  style: thin.copyWith(
                      color: groupOrdersTitleTextColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Size: M (Pack of 108) ',
                  style: regular.copyWith(
                      color: productAvailabilityColor, fontSize: 14),
                ),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Verified Purchase',
                  style: thin.copyWith(color: primaryColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Text(
                description,
                style: thin.copyWith(color: mainTitleColor, fontSize: 14),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      width: MediaQuery.of(context).size.width * 0.193,
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
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.0208, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Ratings',
              style: medium.copyWith(color: mainTitleColor, fontSize: 24),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_half,
                  color: ratingColor2,
                  size: 40,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  '4.4',
                  style: regular.copyWith(
                      color: productAvailabilityColor, fontSize: 53),
                ),
                SizedBox(
                  width: 24,
                ),
                VerticalDivider(
                  color: verticalDividerColor,
                  width: 1,
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Text(
                    '138 Ratings & 4 Reviews',
                    maxLines: 2,
                    style: regular.copyWith(
                        color: productAvailabilityColor, fontSize: 16),
                  ),
                )
              ],
            ),
            Text(
              'How ratings calculated?',
              style: regular.copyWith(
                  color: productAvailabilityColor,
                  fontSize: 14,
                  decoration: TextDecoration.underline),
            ),
            RatingIndicator(percent: 0.7, value: '70 %', stars: '5'),
            RatingIndicator(percent: 0.16, value: '16 %', stars: '4'),
            RatingIndicator(percent: 0.09, value: '9 %', stars: '3'),
            RatingIndicator(percent: 0.03, value: '3 %', stars: '2'),
            RatingIndicator(percent: 0.03, value: '3 %', stars: '1'),
          ],
        ),
      ),
    );
  }
}

class RatingIndicator extends StatelessWidget {
  final double percent;
  final String value;
  final String stars;
  const RatingIndicator(
      {Key? key,
      required this.percent,
      required this.value,
      required this.stars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          stars,
          style:
              regular.copyWith(color: productAvailabilityColor, fontSize: 14),
        ),
        Icon(
          Icons.star,
          color: productAvailabilityColor,
          size: 15,
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * 0.1015,
          animation: true,
          lineHeight: 10,
          animationDuration: 2500,
          percent: percent,
          linearStrokeCap: LinearStrokeCap.roundAll,
          barRadius: Radius.circular(10),
          progressColor: ratingColor2,
        ),
        Text(
          value,
          style:
              regular.copyWith(color: productAvailabilityColor, fontSize: 14),
        )
      ],
    );
  }
}
