import 'package:fairyland_shortcuts/utils/platform_util.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../widgets/page.dart';

const List<String> accentColorNames = [
  'System',
  'Yellow',
  'Orange',
  'Red',
  'Magenta',
  'Purple',
  'Blue',
  'Teal',
  'Green',
];

class Settings extends ScrollablePage {
  Settings({super.key});

  @override
  Widget buildHeader(BuildContext context) {
    return const PageHeader(title: Text('设置'));
  }

  @override
  List<Widget> buildScrollable(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final appTheme = context.watch<AppTheme>();
    const spacer = SizedBox(height: 10.0);
    const biggerSpacer = SizedBox(height: 40.0);
    const supportedLocales = FluentLocalizations.supportedLocales;

    final currentLocale =
        appTheme.locale ?? Localizations.maybeLocaleOf(context);

    return [
      Text('主题模式', style: FluentTheme.of(context).typography.subtitle),
      spacer,
      ...List.generate(ThemeMode.values.length, (index) {
        final mode = ThemeMode.values[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RadioButton(
            checked: appTheme.mode == mode,
            onChanged: (value) {
              if (value) {
                appTheme.mode = mode;
                if (kIsWindowEffectsSupported) {
                  appTheme.setEffect(appTheme.windowEffect, context);
                }
              }
            },
            content: Text('$mode'.replaceAll('ThemeMode.', '')),
          ),
        );
      }),
      biggerSpacer,
      Text('导航栏显示', style: FluentTheme.of(context).typography.subtitle),
      spacer,
      ...List.generate(PaneDisplayMode.values.length, (index) {
        final mode = PaneDisplayMode.values[index];
        return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.displayMode == mode,
              onChanged: (value) {
                if (value) {
                  appTheme.displayMode = mode;
                }
              },
              content: Text(mode.toString().replaceAll('PaneDisplayMode.', '')),
            ));
      }),
      biggerSpacer,
      Text(
        '导航栏光标',
        style: FluentTheme.of(context).typography.subtitle,
      ),
      spacer,
      ...List.generate(NavigationIndicators.values.length, (index) {
        final mode = NavigationIndicators.values[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RadioButton(
            checked: appTheme.indicator == mode,
            onChanged: (value) {
              if (value) {
                appTheme.indicator = mode;
              }
            },
            content: Text(
              mode.toString().replaceAll('NavigationIndicators.', ''),
            ),
          ),
        );
      }),
      biggerSpacer,
      Text('颜色', style: FluentTheme.of(context).typography.subtitle),
      spacer,
      Wrap(
        children: [
          Tooltip(
            message: accentColorNames[0],
            child: _buildColorBlock(appTheme, systemAccentColor),
          ),
          ...List.generate(Colors.accentColors.length, (index) {
            final color = Colors.accentColors[index];
            return Tooltip(
              message: accentColorNames[index + 1],
              child: _buildColorBlock(appTheme, color),
            );
          })
        ],
      ),
      if (kIsWindowEffectsSupported) ...[
        biggerSpacer,
        Text(
          '窗口透明度（${defaultTargetPlatform.toString().replaceAll('TargetPlatform.', '')}）',
          style: FluentTheme.of(context).typography.subtitle,
        ),
        spacer,
        ...List.generate(currentWindowEffects.length, (index) {
          final mode = currentWindowEffects[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.windowEffect == mode,
              onChanged: (value) {
                if (value) {
                  appTheme.windowEffect = mode;
                  appTheme.setEffect(mode, context);
                }
              },
              content: Text(mode.toString().replaceAll('WindowEffect.', '')),
            ),
          );
        }),
        biggerSpacer,
        Text('文字方向', style: FluentTheme.of(context).typography.subtitle),
        spacer,
        ...List.generate(TextDirection.values.length, (index) {
          final direction = TextDirection.values[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RadioButton(
              checked: appTheme.textDirection == direction,
              onChanged: (value) {
                if (value) {
                  appTheme.textDirection = direction;
                }
              },
              content: Text(
                '$direction'
                    .replaceAll('TextDirection.', '')
                    .replaceAll('rtl', 'Right to left')
                    .replaceAll('ltr', 'Left to right'),
              ),
            ),
          );
        })
      ]
    ];
  }

  Widget _buildColorBlock(AppTheme appTheme, AccentColor color) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Button(
          onPressed: () {
            appTheme.color = color;
          },
          style: ButtonStyle(
              padding: ButtonState.all(EdgeInsets.zero),
              backgroundColor: ButtonState.resolveWith((states) {
                if (states.isPressing) {
                  return color.light;
                } else if (states.isHovering) {
                  return color.lighter;
                }
                return color;
              })),
          child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              child: appTheme.color == color
                  ? Icon(
                      FluentIcons.check_mark,
                      color: color.basedOnLuminance(),
                      size: 22.0,
                    )
                  : null)),
    );
  }
}
