import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/fontStyles/kanit.dart';

class HomeCategoryList extends StatelessWidget {
  final List<Categories>? categories;

  const HomeCategoryList({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: SizedBox(
            height: 120,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                              right:
                                  categories?.length == index + 1 ? 0 : 59.0),
                          child: HomeCategoryListItem(
                              category: categories?[index])),
                      itemCount: categories?.length,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 61, top: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: textOnClickColor,
                      child: Center(
                          child: Image.asset(
                        "assets/images/icon-arrow-right.png",
                        width: 16,
                        height: 15,
                      )),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'More',
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    )
                  ],
                ),
              ),
            ])));
  }
}

class HomeCategoryListItem extends StatelessWidget {
  final Categories? category;

  const HomeCategoryListItem({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const ImgProvider(
                    url: "assets/images/dummy/circle.png",
                    width: 70,
                    height: 70,
                  )),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(borderRadius: BorderRadius.circular(50),
                  child: ImgProvider(
                    url: category?.image ?? '',
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
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
