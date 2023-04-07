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
    final devices = [
      Apple.iPhone11,
      Apple.iPhone12,
    ];
    final deviceFrameBuilder = DefaultDeviceFrame(
      setting: DeviceSetting.firstAsSelected(devices: devices),
    );

    final activeFrameBuilder = WidgetbookFrame(
      setting: DeviceSetting.firstAsSelected(devices: devices),
    );

    return Widgetbook.material(
      addons: [
        FrameAddon(
          setting: FrameSetting.firstAsSelected(
            frames: [
              deviceFrameBuilder,
              NoFrame(),
              activeFrameBuilder,
            ],
          ),
        ),
        TextScaleAddon(
          setting: TextScaleSetting.firstAsSelected(
            textScales: [1, 2],
          ),
        ),
        CustomThemeAddon<ThemeData>(
          setting: CustomThemeSetting.firstAsSelected(
            themes: [
              WidgetbookTheme(data: AppTheme.light, name: 'light theme'),
              WidgetbookTheme(data: AppTheme.dark, name: 'dark theme'),
              WidgetbookTheme(data: ThemeData.light(), name: 'default light'),
              WidgetbookTheme(data: ThemeData.dark(), name: 'default dark'),
            ],
          ),
        ),
      ],
      appBuilder: (context, child) {
        final frameBuilder = context.frameBuilder;
        final theme = context.theme<ThemeData>();
        return Theme(
          data: theme!,
          child: frameBuilder!(
            context,
            Scaffold(body: Center(child: child)),
          ),
        );
      },
      directories: [
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookComponent(
              name: 'List Items',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default List Item',
                  builder: (context) => ListItem(
                    titleLabel: context.knobs.text(label: 'Title', initialValue: 'Title'),
                    leading: Icon(
                      context.knobs.options(
                        label: 'Leading',
                        options: [Icons.add, Icons.crop_square_sharp, Icons.circle],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
