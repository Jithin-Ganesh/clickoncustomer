import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/material.dart';

import 'TopPickItem.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1111.64,
        height: 360,
        color: borderColor,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [const SizedBox(width: 30,),
                Text(
                  titleTopPicksForYou,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),const SizedBox(height: 28,),
            const TopPickItem()
          ],
        ),
      ),
    );
  }
}


