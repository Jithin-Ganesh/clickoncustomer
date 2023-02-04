import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontStyles/kanit.dart';


class CustomTitleBar extends StatelessWidget {
  final String title;
  final bool isShop;
  const CustomTitleBar({
    Key? key,
    required this.title,
    this.isShop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: medium.copyWith(color: mainTitleColor, fontSize: 24),
          textAlign: TextAlign.left,
        ),
        Spacer(),
        isShop
            ? TextButton(onPressed: () { Navigator.pushNamed(context, HomeScreenWeb.routeName); },
            child: Text( 'Shop More',
          style: medium.copyWith(
              color: productAvailabilityColor,
              decoration: TextDecoration.underline,
              fontSize: 16),),

              )
            : SizedBox(
                width: 1,
              ),
      ],
    );
  }
}
