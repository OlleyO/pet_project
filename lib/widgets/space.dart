import 'package:flutter/cupertino.dart';

/// Spacing widget
abstract class Space {
  /// Vertical space
  static SizedBox vertical(double space) => SizedBox(
        height: space,
      );

  /// Horizontal space
  static SizedBox horizontal(double space) => SizedBox(
        width: space,
      );
}
