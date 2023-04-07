import 'package:flutter/widgets.dart';

class Spacing {
  Spacing._();

  /// Shortcut for EdgeInsets.all([padding])
  static const paddingAll = EdgeInsets.all(padding);

  /// Shortcut for EdgeInsets.all([margin])
  static const marginAll = EdgeInsets.all(margin);

  /// padding value
  static const padding = 16.0;

  /// margin value
  static const margin = 24.0;
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
