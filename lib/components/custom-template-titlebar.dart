import 'package:clickoncustomer/utils/constants/fontStyles/kanit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTemplateTittleBar extends StatelessWidget {
  const CustomTemplateTittleBar({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
            width: 20,
            child: Divider(color: Colors.black,
              height: 2,
            )),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: sansBold.copyWith(fontSize: 18, color: Colors.black),
        )
      ],
    );
  }
}
