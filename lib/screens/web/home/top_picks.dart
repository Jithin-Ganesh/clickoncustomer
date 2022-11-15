import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../components/TopPickItem.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              titleTopPicksForYou,
              style:
              medium.copyWith(fontSize: 24, color: categoriesTextColor),
            ),
          ],
        ),
        SizedBox(height: 29,),
        const TopPickItem(),
        SizedBox(height: 40,)
      ],
    );
  }
}
