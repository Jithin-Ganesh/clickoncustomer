import 'package:clickoncustomer/Flavor.dart';
import 'package:clickoncustomer/routes.dart';
import 'package:clickoncustomer/screens/login_screen.dart';
import 'package:clickoncustomer/screens/test-screen.dart';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/utils/custom-scroll.dart';
import 'package:clickoncustomer/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Flavor.isDev = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: ProviderTree().get(context),
      child: MaterialApp(
        title: 'Flutter Demo', debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        scrollBehavior: MyCustomScrollBehavior(),
        home:LoginScreen(),
        routes: AppRoutes().get(context),
      ),
    );
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
