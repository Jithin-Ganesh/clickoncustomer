import 'package:flutter/material.dart';

import '../utils/constants/color.dart';

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    Key? key,
    this.onPressed,
    this.buttonTitle,
    this.elevation = 20,
    this.color = primaryColor,
    this.isLoading = false,
    this.isButtonEnable = false,
    this.loadingText,
    this.height = 70,
    this.width = double.infinity,
    this.foregroundColor = canvasColor,
    this.textStyle,
    this.radius = 10,
  }) : super(key: key);
  final String? buttonTitle;
  final VoidCallback? onPressed;
  final double elevation;
  final double radius;
  final Color color;
  final bool isLoading;
  final bool isButtonEnable;
  final String? loadingText;
  final double height;
  final double width;
  final TextStyle? textStyle;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    OutlinedBorder? outlinedBorder(state) {
      if (state == MaterialState.disabled) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        );
      } else {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        );
      }
    }

    return SizedBox(
      //width:200,
      height: height,
      width: width,

      child: Material(
        elevation: elevation,
        shadowColor: primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(radius),
        child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            textStyle:
            MaterialStateProperty.resolveWith((state) => textStyle),
            foregroundColor:
            MaterialStateProperty.all<Color>(foregroundColor),
            backgroundColor:
            MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius))),
          ),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(isLoading ? loadingText ?? '' : buttonTitle ?? ''),
              )),
        ),
      ),
    );
  }
}
