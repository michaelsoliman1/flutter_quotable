import 'dart:core';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(AppUIWidgetbook());
}

class AppUIWidgetbook extends StatelessWidget {
  const AppUIWidgetbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'App UI',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: AppTheme.light,
        ),
      ],
      devices: [
        Device(
          name: 'iPhone 12',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2532.0,
              width: 1170.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
      ],
      frames: [
        WidgetbookFrame(
          name: 'Widgetbook',
          allowsDevices: true,
        ),
      ],
      scaffoldBuilder: (context, frame, child) {
        return Scaffold(
          body: Center(child: child),
        );
      },
      categories: [
        WidgetbookCategory(
          name: 'UI',
          folders: [
            WidgetbookFolder(
              name: 'widgets',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'items',
                  widgets: [
                    WidgetbookComponent(
                      name: 'ListItem',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default List Item',
                          builder: (context) => ListItem(
                            titleLabel: "test",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
