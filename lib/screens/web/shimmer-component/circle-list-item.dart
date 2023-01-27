import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleListItem extends StatelessWidget {
  const CircleListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                'https://flutter'
                '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        itemCount: 8,scrollDirection: Axis.horizontal,
      ),
    );
  }
}
