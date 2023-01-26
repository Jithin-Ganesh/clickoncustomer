import 'package:clickoncustomer/models/top-picks.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/TopPickItem.dart';
import '../../../utils/constants/fontstyles.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              titleTopPicksForYou,
              style: medium.copyWith(fontSize: 24, color: categoriesTextColor),
            ),
          ],
        ),
        SizedBox(
          height: 29,
        ),
        FutureBuilder(
            future: context.read<CategoryProvider>().fetchTopPicks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 12,
                    ),
                  ),
                );
              } else {
                if (snapshot.hasData) {
                  final catList = snapshot.data as List<TopPicks>;
                  return const TopPickItem();
                }
              }
              return Text(
                snapshot.error.toString(),
              );
            }),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
