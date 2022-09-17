import 'package:flutter/cupertino.dart';

import '../../../utils/constants/color.dart';

class AccountBox extends StatefulWidget {
  const AccountBox({Key? key}) : super(key: key);

  @override
  _AccountBoxState createState() => _AccountBoxState();
}

class _AccountBoxState extends State<AccountBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 381,
      decoration: BoxDecoration(
          color: canvasColor, borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
