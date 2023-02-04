import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontStyles/kanit.dart';


class CustomQuestions extends StatelessWidget {
  final String question;
  final String answer;
  final String like;
  final String dislike;
  const CustomQuestions(
      {Key? key,
      required this.question,
      required this.answer,
      required this.like,
      required this.dislike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 24,
                  width: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      color: primaryColor),
                  child: Center(
                    child: Text(
                      'Q',
                      style: regular.copyWith(color: canvasColor, fontSize: 14),
                    ),
                  ),
                ),  SizedBox(width: 11,),
                Text(
                  question,
                  style: regular.copyWith(color: mainTitleColor, fontSize: 16),
                ),
              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  like,
                  style: regular.copyWith(
                      color: productAvailabilityColor, fontSize: 14),
                ),
                SizedBox(width: 14,),
                Icon(
                  Icons.thumb_up,
                  size: 18,
                  color: ogPriceColor,
                ),  SizedBox(width: 25,),
                Text(
                  dislike,
                  style: regular.copyWith(
                      color: productAvailabilityColor, fontSize: 14),
                ),  SizedBox(width: 14,),
                Icon(
                  Icons.thumb_down,
                  size: 18,
                  color: ogPriceColor,
                ),  SizedBox(width: 23,),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 18,color:productAvailabilityColor ,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 11,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'A',
                  style: regular.copyWith(color: mainTitleColor, fontSize: 14),
                ),  SizedBox(width: 20,),
                Text(
                  answer,
                  style: regular.copyWith(color: mainTitleColor, fontSize: 14),
                ),
              ],
            ),
            Text(
              ' On 17 March, 2022',
              style:
                  thin.copyWith(color: discountPriceColor, fontSize: 14),
            ),
          ],
        )
      ],
    );
  }
}

class QuestionsAndAnswers extends StatelessWidget {
  const QuestionsAndAnswers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customer questions & answers',
                style: medium.copyWith(color: mainTitleColor, fontSize: 24),
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Text(
                    'Didn\'t get the right answer you were looking for',
                    style: regular.copyWith(color: reviewTextColor, fontSize: 14),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  SizedBox(width: 217,height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        primary: productDetailsScreenBoxColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Post Your Question',
                        style: medium.copyWith(color: mainTitleColor, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 42,),
          Container(
            height: 242,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: bgColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomQuestions(
                      question: 'Is it pant style or tape style !?',
                      answer: 'Taped diapers',
                      like: '2',
                      dislike: '0'),
                  Divider(
                    color: dividerColor2,
                    height: 1,
                  ),
                  CustomQuestions(
                      question:
                          'While applying for monthly subscription can we change the size of pampers pants',
                      answer: 'Yes',
                      like: '2',
                      dislike: '0')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
