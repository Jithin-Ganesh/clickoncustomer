import 'package:clickoncustomer/components/web/text-dropdown.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

class CheckContainer extends StatelessWidget {
  const CheckContainer(
      {Key? key,
      required this.color,
      required this.isDivider,
      this.divWidth,
      required this.isImage})
      : super(key: key);
  final Color color;
  final bool isImage;
  final bool isDivider;
  final double? divWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isDivider
            ? SizedBox(
                width: divWidth,
                child: Divider(
                  color: orderDivColor,
                  height: 3,
                ))
            : const SizedBox.shrink(),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.all(color: color)),
          child: isImage!
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: ImgProvider(
                    url: "assets/images/dummy/tick.png",
                    width: 13,
                    height: 9,
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
