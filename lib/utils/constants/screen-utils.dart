import 'package:flutter/cupertino.dart';

const WIDTH_RATIO = 1/1920;


calcWidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width * WIDTH_RATIO;
}

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}