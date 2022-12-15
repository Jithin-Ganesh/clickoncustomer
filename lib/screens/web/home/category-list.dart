import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/fontstyles.dart';



class HomeCategoryList extends StatelessWidget {
  final List<Categories>? categories;

  const HomeCategoryList({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Container(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                          right: categories?.length == index + 1 ? 0 : 59.0),
                      child: HomeCategoryListItem(category: categories?[index]),
                    ),
                    itemCount: categories?.length,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 61),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Center(
                        child: Image.asset(
                      "assets/images/icon-arrow-right.png",
                      width: 16,
                      height: 15,
                    )),
                    backgroundColor: textOnClickColor,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'More',
                    style: thin.copyWith(fontSize: 14, color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCategoryListItem extends StatelessWidget {
  final Categories? category;

  const HomeCategoryListItem({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: canvasColor,
            child: ImgProvider(
              url: category?.image ?? '',
              height: 60,
              width: 74,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            category?.name ?? '',
            style: thin.copyWith(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}
