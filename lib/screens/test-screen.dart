import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          SizedBox(
            height: 100,
            width: 350,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("proceed"),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 10),
          Text(
            "buy",
            style: Theme.of(context).textTheme.button,
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(onPressed: () {}, child: const Text("uwu"), style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: primaryColor),
          ),)
        ],
      ),
    );
  }
}
