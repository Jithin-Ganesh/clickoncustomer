import 'package:clickoncustomer/components/account_subcomponent.dart';
import 'package:clickoncustomer/components/buyTogetherItem.dart';
import 'package:clickoncustomer/components/checkout_component.dart';
import 'package:clickoncustomer/components/login_screen.dart';
import 'package:clickoncustomer/components/payment_item.dart';
import 'package:clickoncustomer/components/productDetailTitle.dart';
import 'package:clickoncustomer/components/rate-your-experience-screen1.dart';
import 'package:clickoncustomer/components/reviewItems.dart';
import 'package:clickoncustomer/components/revieworderitem.dart';
import 'package:clickoncustomer/components/sign-up.dart';
import 'package:clickoncustomer/components/similarProductItems.dart';
import 'package:clickoncustomer/components/top_picks.dart';
import 'package:clickoncustomer/components/youorders-item.dart';
import 'package:clickoncustomer/components/youraccount.dart';
import 'package:clickoncustomer/components/yourcart.dart';
import 'package:clickoncustomer/components/youritems_item.dart';
import 'package:clickoncustomer/screens/test-screen.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/routes.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/material.dart';

import 'components/rate-your-experience-screen2.dart';
import 'components/rate-your-experience-screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoutes.get(context),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:RateYourExperience3());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
