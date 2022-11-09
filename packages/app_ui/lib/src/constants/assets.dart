import 'package:flutter/widgets.dart';

/// App Assets
class Assets {
  Assets._();

  // since assets are in diffenet package, we need to add the package name to [AssetImage]
  static const _packageName = 'app_ui';

  /// Image used to indicate empty page
  static AssetImage emptyPage = const AssetImage('assets/images/empty-box.png', package: _packageName);
}
