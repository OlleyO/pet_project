import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumberCompact extends StatelessWidget {
  final int number;
  final TextStyle? style;

  const NumberCompact(
    this.number, {
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      NumberFormat.compact().format(number),
      style: style,
    );
  }
}
