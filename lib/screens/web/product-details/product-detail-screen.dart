import 'package:clickoncustomer/components/productDetailTitle.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/product-details/image-details.dart';
import 'package:clickoncustomer/screens/web/product-details/product-details.dart';
import 'package:clickoncustomer/screens/web/product-details/specifications.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/web-nav-bar.dart';
import '../../../utils/constants/fontstyles.dart';
import 'buy-together.dart';

class ProductDetailScreenWeb extends StatefulWidget {
  static const routeName = '/product-detail-web';
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
      backgroundColor: canvasColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailTitle(),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: ImageDetailsWeb()),
                Flexible(
                    flex: 2,
                    child: ProductDetails())
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BuyTogether(),
            Specifications(specs: specs),
            BottomWebBar()
          ],
        ),
      ),
    );
  }
}
