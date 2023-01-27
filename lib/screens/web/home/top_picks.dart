import 'package:clickoncustomer/models/top-picks.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/shimmer-component/products-box-shimmer-list.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/TopPickItem.dart';
import '../../../utils/constants/fontstyles.dart';
import '../shimmer-component/shimmer-loading.dart';

class TopPicks extends StatefulWidget {
  const TopPicks({Key? key}) : super(key: key);

  @override
  State<TopPicks> createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicks> {


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
            future: Provider.of<CategoryProvider>(context, listen: false)
                .fetchTopPicks(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ShimmerLoading(
                  isLoading: true,
                  child: ProductsShimmerList(),
                );
              } else {
                if (snapshot.hasData) {
                  final catList = snapshot.data as List<TopPickModel>;
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
