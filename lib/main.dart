import 'package:clickoncustomer/components/buyTogetherItem.dart';
import 'package:clickoncustomer/components/checkout_component.dart';
import 'package:clickoncustomer/components/productDetailTitle.dart';
import 'package:clickoncustomer/components/reviewItems.dart';
import 'package:clickoncustomer/components/revieworderitem.dart';
import 'package:clickoncustomer/components/similarProductItems.dart';
import 'package:clickoncustomer/components/top_picks.dart';
import 'package:clickoncustomer/components/yourcart.dart';
import 'package:clickoncustomer/components/youritems_item.dart';
import 'package:clickoncustomer/screens/test-screen.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ReviewOrderItem(
          title: titleDueDate,
          itemName: textYourCartItemName,
          soldBy: true,
          price: yourCartAmount,
          offerPrice: offerAmount,
          isGift: true,
          isOrder: true,
        ));
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
