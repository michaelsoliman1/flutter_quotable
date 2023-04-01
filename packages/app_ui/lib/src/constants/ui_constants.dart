import 'package:flutter/widgets.dart';

class Paddings {
  Paddings._();

  /// Inner padding
  static const innerAll = EdgeInsets.all(inner);

  /// Inner padding
  static const outerAll = EdgeInsets.all(outer);

  /// Inner padding value
  static const inner = 16.0;

  /// Outer padding
  static const outer = 24.0;
}

class Corners {
  Corners._();

  /// Inner rorner radius
  static final innerRadius = BorderRadius.circular(inner);

  /// Outer corner radius
  static final outerRadius = BorderRadius.circular(outer);

  /// Inner corner value
  static const inner = 15.0;

  /// Outer corner value
  static const outer = 10.0;
}
