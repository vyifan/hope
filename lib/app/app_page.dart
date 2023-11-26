import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart';
import 'package:hope/app/main_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

import '../core/constants/index.dart';
import '../theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppTheme(),
        builder: (context, _) {
          final appTheme = context.watch<AppTheme>();
          return FluentApp(
            title: AppConstant.appTitle,
            themeMode: appTheme.mode,
            debugShowCheckedModeBanner: false,
            color: appTheme.color,
            darkTheme: FluentThemeData(
                brightness: Brightness.dark,
                accentColor: appTheme.color,
                visualDensity: VisualDensity.standard,
                focusTheme: FocusThemeData(
                  glowFactor: is10footScreen(context) ? 2.0 : 0.0,
                )),
            theme: FluentThemeData(
                accentColor: appTheme.color,
                visualDensity: VisualDensity.standard,
                focusTheme: FocusThemeData(
                  glowFactor: is10footScreen(context) ? 2.0 : 0.0,
                )),
            locale: appTheme.locale,
            builder: (context, child) {
              return Directionality(
                  textDirection: appTheme.textDirection,
                  child: NavigationPaneTheme(
                    data: NavigationPaneThemeData(
                        backgroundColor: appTheme.windowEffect !=
                                flutter_acrylic.WindowEffect.disabled
                            ? Colors.transparent
                            : null),
                    child: child!,
                  ));
            },
            initialRoute: '/',
            routes: {'/': (context) => const MainPage()},
          );
        });
  }
}
