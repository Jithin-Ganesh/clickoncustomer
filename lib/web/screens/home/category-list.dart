import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
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
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...categories!.map((e) => HomeCategoryListItem(category: e)),
            CircleAvatar(
              radius: 35,
              child: Center(child: Image.asset( "assets/images/icon-arrow-right.png",width: 16,height: 15,)),
              backgroundColor: textOnClickColor,
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
            child:
            Image.asset(category?.image ?? '',height: 60,width: 74,),
            backgroundColor: canvasColor,
          ),
          Text(
            category?.name ?? '',
            style: thin.copyWith(fontSize: 14,color: Colors.black),
          )
        ],
      ),
    );
  }
}
