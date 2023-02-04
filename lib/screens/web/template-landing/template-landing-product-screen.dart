import 'package:clickoncustomer/components/custom-template-titlebar.dart';
import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/components/textformfiled-title-subscribe-button.dart';
import 'package:clickoncustomer/utils/constants/fontStyles/kanit.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../components/template-services.dart';
import '../../../models/product-model.dart';
import '../../../providers/category-provider.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/pref_utils.dart';
import '../home/best-selling.dart';
import '../home/fashion-store.dart';
import '../home/products-for-you.dart';
import '../shimmer-component/products-box-shimmer-list.dart';
import '../shimmer-component/shimmer-loading.dart';

class TemplateLandingProduct extends StatelessWidget {
  const TemplateLandingProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 2,
            child: Container(
              color: templateBgColor,
              child: Column(
                children: [
                  FutureBuilder(
                      future:
                          Provider.of<CategoryProvider>(context, listen: false)
                              .fetchProductsForYou(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const ShimmerLoading(
                            isLoading: true,
                            child: ProductsShimmerList(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            final products =
                                snapshot.data as List<ProductModel>;
                            return Visibility(
                              //visible: false,
                              visible: PrefUtils().getToken() != null &&
                                  products.isNotEmpty,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.148),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    CustomTemplateTittleBar(
                                        title: 'Featured products'),
                                    SizedBox(
                                      height: 38,
                                    ),
                                    ProductsForYouList(),
                                  ],
                                ),
                              ),
                            );
                          }
                        }
                        return Text(
                          snapshot.error.toString(),
                        );
                      }),
                  FutureBuilder(
                      future:
                          Provider.of<CategoryProvider>(context, listen: false)
                              .fetchProductsForYou(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const ShimmerLoading(
                            isLoading: true,
                            child: ProductsShimmerList(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            final products =
                                snapshot.data as List<ProductModel>;
                            return Visibility(
                              //visible: false,
                              visible: PrefUtils().getToken() != null &&
                                  products.isNotEmpty,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.148),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    ProductsForYouList(),
                                  ],
                                ),
                              ),
                            );
                          }
                        }
                        return Text(
                          snapshot.error.toString(),
                        );
                      }),
                  const SizedBox(
                    height: 83,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.148),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTemplateTittleBar(
                            title: "Featured products"),
                        const SizedBox(
                          height: 46,
                        ),
                        FashionStore(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 83,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.148),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTemplateTittleBar(
                            title: "Featured products"),
                        const SizedBox(
                          height: 46,
                        ),
                        BestSelling()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 117,
                  ),
                  const Divider(
                    height: 2,
                    color: dotColor,
                  ),
                  const SizedBox(
                    height: 125,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.194,
                        ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImgProvider(
                          url: "assets/images/dummy/premium.png",
                          width: MediaQuery.of(context).size.width * 0.162,
                          height: 312,
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Every product comes with\nAn unbeatable 3 year guarantee",
                              style: sansBold.copyWith(
                                  fontSize: 40, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nFusce quis urna bibendum, dictum ex quis, urna bibendum tincidunt nulla.",
                              style: sansRegular.copyWith(
                                  fontSize: 16, color: templateRandomTextColor),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TemplateServices(
                                  image: 'assets/images/dummy/truck.png',
                                  text: 'Free Home Delivery',
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                TemplateServices(
                                  image: 'assets/images/dummy/payment.png',
                                  text: 'Secure payment',
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                TemplateServices(
                                  image: 'assets/images/dummy/headphone.png',
                                  text: '24x7 Support',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const TitleTextFormFiledButton(
                                buttonColor: Colors.black,
                                title: "Drop your email for updates on offers.")
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  Container(
                    color: templateMultiCartContainerColor,
                    height: 300,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.148,
                          right: MediaQuery.of(context).size.width * 0.1520,
                          top: 115,
                          bottom: 111),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ImgProvider(
                            url: "assets/images/dummy/multicart.png",
                            color: templateMultiCartContainerColor,
                            width: 74,
                            height: 40,
                          ),
                          TitleTextFormFiledButton(
                              buttonColor: templateMultiCartRedContainerColor,
                              title: "Drop your email for updates on offers.")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
