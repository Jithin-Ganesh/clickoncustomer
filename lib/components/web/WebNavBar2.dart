import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/providers/cart-provider.dart';
import 'package:clickoncustomer/providers/location.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/web/cart/cart-screen.dart';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/screens/web/your-account/your-account-web.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:yandex_geocoder/yandex_geocoder.dart';

import '../../screens/login_screen.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';
import '../../utils/constants/map-key.dart';
import '../../utils/pref_utils.dart';
import 'map.dart';

class WebNavBar2 extends StatefulWidget {
  const WebNavBar2({Key? key}) : super(key: key);

  @override
  State<WebNavBar2> createState() => _WebNavBar2State();
}

class _WebNavBar2State extends State<WebNavBar2> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      backgroundColor: canvasColor,
      elevation: 2,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.078,
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, HomeScreenWeb.routeName);
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/clickOn-logo.png',
                    height: 37,
                    width: 60,
                  ),
                  Text(
                    'Click On Offers',
                    style:
                        medium.copyWith(fontSize: 12, color: webNavTitleColor),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.404,
                child: Material(
                  elevation: 3.0,
                  shadowColor: shadowColor2,
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      buildAwesomeDialog(context);
                    },
                    decoration: InputDecoration(
                        // prefixIconConstraints:
                        //     BoxConstraints.tight(Size.fromWidth(13)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/searchIcon.png',
                            width: 13,
                            height: 13,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        // border: InputBorder.none,
                        hintText: 'Search What are you looking for...',
                        filled: true,
                        hintStyle: thin,
                        // suffixIcon: Padding(
                        //   padding: const EdgeInsets.only(right: 20.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       Text(
                        //         'All',
                        //         style: medium,
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       Image.asset(
                        //         'assets/images/icon-arrow-down.png',
                        //         width: 8,
                        //         height: 5,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        fillColor: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 160.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_location_alt_outlined,
                            size: 22,
                            color: canvasColor,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Deliver to',
                            style: thin.copyWith(
                                color: productAvailabilityColor, fontSize: 14),
                          ),
                          Image.asset(
                            'assets/images/icon-arrow-down-outlined.png',
                            height: 5,
                            width: 10,
                          ),
                        ],
                      ),
                      Text(
                        'Ernakulam 682024',
                        style: medium,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 43,
              ),
              const VerticalDivider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: verticalDividerColor,
              ),
              const SizedBox(
                width: 49,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, YourAccountWeb.routeName);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: primaryColor,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 22,
                        color: canvasColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Consumer<UserProvider>(
                    builder: (context, value, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello,',
                          style: thin.copyWith(color: productAvailabilityColor),
                        ),
                        Row(
                          children: [
                            value.user != null
                                ? Text(
                                    value.user?.firstName ?? 'sign-in',
                                    style: medium,
                                  )
                                : Text(
                                    'sign-in',
                                    style: medium,
                                  ),
                            Image.asset(
                              'assets/images/icon-arrow-down-outlined.png',
                              height: 5,
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 23,
              ),
              const VerticalDivider(
                thickness: 1,
                indent: 5,
                endIndent: 5,
                color: verticalDividerColor,
              ),
              const SizedBox(
                width: 36,
              ),
              Consumer<CartProvider>(
                builder: (context, value, child) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon-heart-oulined.png',
                      height: 20,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    IconButton(
                        onPressed: () {
                          if (PrefUtils().getToken() != null) {
                            Navigator.pushNamed(
                                context, CartScreenWeb.routeName);
                          } else {
                            Navigator.pushNamed(context, LoginScreen.routeName,
                                arguments: const LoginScreen(isLoggedIn: true));
                          }
                        },
                        icon: Stack(
                          children: [
                            const ImgProvider(
                              url: 'assets/images/icon-cart.png',
                              height: 65,
                              width: 68,
                              boxFit: BoxFit.contain,
                            ),
                            Visibility(
                              visible: value.cart?.cartProducts?.isNotEmpty ?? false,
                              child: Positioned(
                                top: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: primaryColor,
                                  child: Text(
                                    '${value.cart?.cartProducts?.length}',
                                    style: medium.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                    Text(
                      'Cart',
                      style: medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160.0),
          child: Column(
            children: [
              const Divider(
                color: horizontalDividerColor,
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 280,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Home',
                          style: medium.copyWith(
                              color: contactTitleColor, fontSize: 16),
                        ),
                        Text(
                          'Shop',
                          style: medium.copyWith(
                              color: subTextGeneralColor, fontSize: 16),
                        ),
                        Text(
                          'Offers',
                          style: medium.copyWith(
                              color: subTextGeneralColor, fontSize: 16),
                        ),
                        Text(
                          'Support',
                          style: medium.copyWith(
                              color: subTextGeneralColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 38,
                      width: 197,
                      decoration: const BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(8)),
                          color: priceDetailsSubTextColor,
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon-tag.png',
                            height: 19,
                            width: 19,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Post an add',
                            style: medium.copyWith(
                                color: canvasColor, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AwesomeDialog buildAwesomeDialog(BuildContext context) {
  return AwesomeDialog(
    headerAnimationLoop: true,
    width: MediaQuery.of(context).size.width * 0.621,
    dismissOnTouchOutside: true,
    btnOk: const SizedBox(
      width: 0,
    ),
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.noHeader,
    dialogBorderRadius: BorderRadius.circular(10.0),
    body: const LocationSearch(),
    btnOkOnPress: () {},
  )..show();
}

class LocationSearch extends StatefulWidget {
  const LocationSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  double currentSliderValue = 10;
  late TextEditingController locationController;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() => _currentPosition = position);
    _getAddressFromLatLng();
    print(position);
  }

  Position? _currentPosition;
  String? _currentAddress;

  Future<void> _getAddressFromLatLng() async {
    if (_currentPosition != null) {
      _currentAddress = null;
      log('fetching address....');
      try {
        await context
            .read<LocationProvider>()
            .fetchLocationDetails()
            .then((value) {
          setState(() {
            locationController.text = value;
          });
        });

        // final YandexGeocoder geocoder = YandexGeocoder(apiKey: "AIzaSyDDFUaNGnX0xIKx6oSOnWaEnUs9QotNzRg",);
        //
        // final GeocodeResponse geocodeFromPoint = await geocoder.getGeocode(GeocodeRequest(
        //   geocode: PointGeocode(latitude: 55.771899, longitude: 37.597576),
        //   lang: Lang.enEn,
        // ));
        //
        // setState(() {
        //   _currentAddress =
        //       "${geocodeFromPoint.firstFullAddress}";
        //   log('address $_currentAddress');
        // });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    locationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 42, top: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search Offers Nearby",
                  style: medium.copyWith(
                      fontSize: 22, color: productDetailsScreenTotalColor),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 15,
                    color: productDetailsScreenTotalColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 49,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.365,
                  height: 56,
                  decoration: BoxDecoration(
                      border: Border.all(color: contactTitleColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 22, top: 14, bottom: 14),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: thin.copyWith(
                              fontSize: 18, color: clickOnOffersTitleColor)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.263,
                      height: 56,
                      decoration: BoxDecoration(
                          border: Border.all(color: locationColor),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            border: InputBorder.none,
                            hintStyle: thin.copyWith(
                                fontSize: 18, color: clickOnOffersTitleColor)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: getCurrentLocation,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.098,
                        height: 56,
                        decoration: BoxDecoration(
                            border: Border.all(color: locationColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.016),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.my_location_sharp,
                                  size: 20,
                                  color: contactTitleColor,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Text(
                                    "Locate me",
                                    style: medium.copyWith(
                                        fontSize: 18, color: contactTitleColor),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Locate Within",
                      style: medium.copyWith(
                          fontSize: 18, color: productDetailsScreenTotalColor),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    StatefulBuilder(
                      builder: (context, state) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.228,
                          child: Slider(
                              divisions: 10,
                              min: 0,
                              label: currentSliderValue.round().toString(),
                              activeColor: contactTitleColor,
                              thumbColor: contactTitleColor,
                              value: currentSliderValue,
                              max: 100,
                              onChanged: (double value) {
                                state(() {
                                  currentSliderValue = value;
                                });
                              }),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 27,
                    ),
                    Text(
                      currentSliderValue.toString() + "km",
                      style: medium.copyWith(
                          fontSize: 18, color: productDetailsScreenTotalColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
          Center(
            child: ButtonElevated(
                color: elevatedColor,
                radius: 10,
                height: 45,
                onPressed: () {},
                width: MediaQuery.of(context).size.width * 0.18,
                buttonTitle: "START LOOKING"),
          ),
          const SizedBox(
            height: 43,
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: getMap(),
          ),
          // ImgProvider(
          //   url: "assets/images/dummy/map.png",
          //   width: MediaQuery.of(context).size.width * 0.6,
          //   height: 227,
          // )
        ],
      ),
    );
  }
}
