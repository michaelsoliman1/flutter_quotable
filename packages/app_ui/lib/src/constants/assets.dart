import 'package:flutter/widgets.dart';

/// App Assets
class Assets {
  Assets._();

  // since assets are in diffenet package, we need to add the package name to [AssetImage]
  static const _packageName = 'app_ui';

  static AssetImage logo = const AssetImage(
    'assets/images/logo.png',
    package: _packageName,
  );

  static AssetImage emptyPage = const AssetImage(
    'assets/images/empty-box.png',
    package: _packageName,
  );
}
