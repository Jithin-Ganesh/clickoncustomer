import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';
import '../../../utils/image-provider.dart';


class ImageDetailsWebItem extends StatefulWidget {
  final ProductModel? productModel;
  const ImageDetailsWebItem({Key? key, this.productModel}) : super(key: key);

  @override
  State<ImageDetailsWebItem> createState() => _ImageDetailsWebItemState();
}

class _ImageDetailsWebItemState extends State<ImageDetailsWebItem> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // IconButton(
              //   onPressed: () {
              //     if(selectedIndex>0) {
              //       setState(() {
              //         selectedIndex--;
              //       });
              //     }else if(selectedIndex == 0){
              //       setState(() {
              //         selectedIndex = (value.productDetails!.length -1);
              //       });
              //     }
              //
              //   },
              //   icon: Container(
              //     height: 23,
              //     width: 23,
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: Border.all(color: mainTitleColor.withOpacity(0.5))),
              //     child: Icon(
              //       Icons.keyboard_arrow_left,
              //       color: mainTitleColor,
              //     ),
              //   ),
              // ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.068,),
              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color:  specificationsColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: ImgProvider(height: 50,width: 50,
                      url: widget.productModel?.images ?? '', ),
                  )),
              SizedBox(width: MediaQuery.of(context).size.width * 0.068,),
              // IconButton(
              //   onPressed: () {
              //     if(selectedIndex<(value.productDetails!.length -1)) {
              //       setState(() {
              //         selectedIndex++;
              //       });
              //     }else if(selectedIndex == (value.productDetails!.length -1)){
              //       setState(() {
              //         selectedIndex = 0;
              //       });
              //     }
              //   },
              //   icon: Container(
              //     height: 23,
              //     width: 23,
              //     decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: Border.all(color: mainTitleColor.withOpacity(0.5))),
              //     child: const Center(
              //       child: Icon(
              //         Icons.keyboard_arrow_right,
              //         color: mainTitleColor,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Visibility(
              //   visible: selectedIndex > 0,
              //   child: IconButton(
              //     onPressed: () {
              //       if(selectedIndex>0) {
              //         setState(() {
              //           selectedIndex--;
              //         });
              //       }else if(selectedIndex == 0){
              //         setState(() {
              //           selectedIndex = (value.productDetails!.length -1);
              //         });
              //       }
              //
              //     },
              //     icon: Container(
              //       height: 46,
              //       width: MediaQuery.of(context).size.width *  0.0239,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: mainTitleColor.withOpacity(0.5),
              //          ),
              //       child: Icon(
              //         Icons.keyboard_arrow_left,
              //         color: canvasColor,
              //       ),
              //     ),
              //   ),
              // ),
              ImgProvider(
                url: widget.productModel?.images ?? '',
                height: 410,
                width: MediaQuery.of(context).size.width *0.213,
                boxFit: BoxFit.fill,
              ),
              // Visibility(
              //   visible: selectedIndex != (value.productDetails!.length -1),
              //   child: IconButton(
              //     onPressed: () {
              //       if(selectedIndex<(value.productDetails!.length -1)) {
              //         setState(() {
              //           selectedIndex++;
              //         });
              //       }else if(selectedIndex == (value.productDetails!.length -1)){
              //         setState(() {
              //           selectedIndex = 0;
              //         });
              //       }
              //
              //     },
              //     icon: Container(
              //       height: 46,
              //       width: MediaQuery.of(context).size.width *  0.0239,
              //       decoration: BoxDecoration(
              //         color: mainTitleColor.withOpacity(0.5),
              //           shape: BoxShape.circle,
              //           ),
              //       child: Icon(
              //         Icons.keyboard_arrow_right,
              //         color: canvasColor,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class ImageDetailsWeb extends StatelessWidget {
  final ProductModel? productModel;
  const ImageDetailsWeb({Key? key,  this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 160.0),
      child: Container(
        height: 620,
        child: ContainedTabBarView(
          tabs: [
            Text('Images (5)',style: medium.copyWith(fontSize: 16,color: mainTitleColor),),
            Text('Videos (1)',style: medium.copyWith(fontSize: 16,color: mainTitleColor),),
          ],
          tabBarProperties: TabBarProperties(
            height: 32.0,
            indicatorColor: Colors.transparent,
            indicatorWeight: 6.0,
            labelColor: Colors.black,
            labelStyle: regular.copyWith(fontSize: 16),
            unselectedLabelColor: mainTitleColor,
          ),
          views: [
            ImageDetailsWebItem(productModel: productModel),
            ImageDetailsWebItem(productModel: productModel),
          ],
        ),
      ),
    );
  }
}
