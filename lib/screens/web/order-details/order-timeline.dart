import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../utils/constants/decoration.dart';

class OrderTimeLine extends StatelessWidget {
  const OrderTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration,
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            endChild: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green)
              ),
            ),
            startChild: Container(
              color: Colors.amberAccent,
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            endChild: Container(
              constraints: const BoxConstraints(
                minWidth: 120,
              ),
              color: Colors.lightGreenAccent,
            ),
            startChild: Container(
              color: Colors.amberAccent,
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            endChild: Container(
              constraints: const BoxConstraints(
                minWidth: 120,
              ),
              color: Colors.lightGreenAccent,
            ),
            startChild: Container(
              color: Colors.amberAccent,
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            endChild: Container(
              constraints: const BoxConstraints(
                minWidth: 120,
              ),
              color: Colors.lightGreenAccent,
            ),
            startChild: Container(
              color: Colors.amberAccent,
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            endChild: Container(
              constraints: const BoxConstraints(
                minWidth: 120,
              ),
              color: Colors.lightGreenAccent,
            ),
            startChild: Container(
              color: Colors.amberAccent,
            ),
          ),
          TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            endChild: Container(
              constraints: const BoxConstraints(
                minWidth: 120,
              ),
              color: Colors.lightGreenAccent,
            ),
            startChild: Container(
              color: Colors.amberAccent,
            ),
          )
        ],
      ),
    );
  }
}
