import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgo extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TimeAgo(
    this.text, {
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      timeago.format(DateTime.parse(text)),
      style: style,
    );
  }
}
