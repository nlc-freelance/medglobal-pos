import 'package:flutter/material.dart';

enum GapDirection { vertical, horizontal }

class AppGap extends StatelessWidget {
  final double space;
  final GapDirection direction;

  const AppGap.v(this.space, {super.key}) : direction = GapDirection.vertical;

  const AppGap.h(this.space, {super.key}) : direction = GapDirection.horizontal;

  @override
  Widget build(BuildContext context) {
    return direction == GapDirection.vertical ? SizedBox(height: space) : SizedBox(width: space);
  }
}
