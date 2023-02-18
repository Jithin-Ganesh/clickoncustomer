import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

Widget getMap() {
  String htmlId = "7";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng = LatLng(1.3521, 103.8198);

    final mapOptions = MapOptions()
      ..zoom = 10
      ..center = LatLng(1.3521, 103.8198);

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = myLatlng
      ..map = map
      ..title = 'Hello World!');

    Circle(CircleOptions()
      ..center = myLatlng
      ..radius = 40000
      ..map = map
      ..visible = true
      // ..strokeColor = "0xff009AFF"
      ..fillColor = "0xff009AFF");

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}

class GetMapView extends StatefulWidget {
  const GetMapView({Key? key}) : super(key: key);

  @override
  State<GetMapView> createState() => _GetMapViewState();
}

class _GetMapViewState extends State<GetMapView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
