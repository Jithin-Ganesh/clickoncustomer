import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color.dart';
import '../utils/constants/fontStyles/kanit.dart';
import 'elevated-buton.dart';

class TitleTextFormFiledButton extends StatelessWidget {
  const TitleTextFormFiledButton(
      {Key? key, required this.buttonColor, required this.title})
      : super(key: key);
  final Color buttonColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: sansRegular.copyWith(fontSize: 14, color: Colors.black),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          width: MediaQuery.of(context).size.width * 0.223,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: templateTextContainerColor),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 7,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    width: 90,
                    height: 36,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 11, bottom: 11, left: 10, right: 11),
                      child: Text(
                        "Subscribe",
                        style: sansBold.copyWith(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  hintText: "name@example.com",
                  border: InputBorder.none),
            ),
          ))
    ]);
  }
}
