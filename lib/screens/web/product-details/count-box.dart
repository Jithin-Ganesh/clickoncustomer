import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:flutter/cupertino.dart';

class CountBox extends StatelessWidget {
  final String count;
  const CountBox({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 40,
        width:  103,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            border: Border.all(color: countBorderColor)
        ),
        child: Center(child: Text(count,style: medium.copyWith(color:mainTitleColor,fontSize: 16 ),textAlign: TextAlign.center,)),
      ),
    );
  }
}
