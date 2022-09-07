import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/web-nav-bar.dart';

class ProductDetailScreenWeb extends StatefulWidget {
  const ProductDetailScreenWeb({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenWebState createState() => _ProductDetailScreenWebState();
}

class _ProductDetailScreenWebState extends State<ProductDetailScreenWeb> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(135), child: WebNavBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BottomWebBar()
          ],
        ),
      ),
    );
  }
}
