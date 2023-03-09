import 'package:clickoncustomer/utils/constants/fontStyles/kanit.dart';
import 'package:clickoncustomer/utils/constants/screen-utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

class TextDropDown extends StatelessWidget {
  const TextDropDown({Key? key, required this.text, required this.isSelected}) : super(key: key);
  final String text; final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isSelected?Text(
          text,
          style: medium.copyWith(fontSize: 18, color: passColor),
        ):Text(
          text,
          style: medium.copyWith(fontSize: 18, color: passColor.withOpacity(0.5)),
        ),
        const SizedBox(
          width: 7,
        ),
        const Icon(
          Icons.keyboard_arrow_down_sharp,
          size: 18,
          color: passColor,
        ),
        SizedBox(
          width: calcWidth(context, 133),
        )
      ],
    );
  }
}
