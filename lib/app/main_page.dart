import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide FilledButton, showDialog;
import 'package:hope/screens/home.dart';
import 'package:hope/theme.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

import '../core/constants/index.dart';
import 'config/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WindowListener {
  bool value = false;
  int index = 0;
  final viewKey = GlobalKey();
  final key = GlobalKey();
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  void resetSearch() => searchController.clear();

  String get searchValue => searchController.text;
  late List<NavigationPaneItem> originalItems;
  late List<NavigationPaneItem> items = originalItems;
  List<NavigationPaneItem> footerItems = AppConfig.footerItems;
  _MainPageState() {
    originalItems = _getNavigationPane();
  }

  @override
  void initState() {
    windowManager.addListener(this);
    searchController.addListener(() {
      setState(() {
        if (searchValue.isEmpty) {
          items = originalItems;
        } else {
          items = [...originalItems, ...footerItems]
              .whereType<PaneItem>()
              .where((item) {
                assert(item.title is Text);
                final text = (item.title as Text).data!;
                return text.toLowerCase().contains(searchValue.toLowerCase());
              })
              .toList()
              .cast<NavigationPaneItem>();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    final theme = FluentTheme.of(context);

    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
          automaticallyImplyLeading: false,
          title: () {
            if (kIsWeb) {
              return const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(AppConstant.appTitle),
              );
            }
            return const DragToMoveArea(
                child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(AppConstant.appTitle),
            ));
          }(),
          actions: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8.0),
                child: ToggleSwitch(
                  content: const Text('夜间模式'),
                  checked: FluentTheme.of(context).brightness.isDark,
                  onChanged: (v) {
                    print(v);
                    print(FluentTheme.of(context).brightness.isDark);
                    appTheme.mode = v ? ThemeMode.dark : ThemeMode.light;
                  },
                ),
              ),
              if (!kIsWeb) const WindowButtons()
            ],
          )),
      pane: NavigationPane(
          selected: () {
            if (searchValue.isEmpty) {
              return index;
            }
            final indexOnScreen = items.indexOf([
              ...originalItems,
              ...footerItems
            ].whereType<PaneItem>().elementAt(index));
            if (indexOnScreen.isNegative) {
              return null;
            }
            return indexOnScreen;
          }(),
          onChanged: (i) {
            if (searchValue.isNotEmpty) {
              final equivalentIndex = [...originalItems, ...footerItems]
                  .whereType<PaneItem>()
                  .toList()
                  .indexOf(items[i] as PaneItem);
              i = equivalentIndex;
            }
            resetSearch();
            setState(() => index = i);
          },
          /*header: SizedBox(
            height: kOneLineTileHeight,
            child: ShaderMask(
              shaderCallback: (rect) {
                final color = appTheme.color.resolveFromReverseBrightness(
                  theme.brightness,
                  level: theme.brightness == Brightness.light ? 0 : 2,
                );
                return LinearGradient(colors: [color, color])
                    .createShader(rect);
              },
              child: const FlutterLogo(
                style: FlutterLogoStyle.horizontal,
                size: 80.0,
                textColor: Colors.white,
                duration: Duration.zero,
              ),
            ),
          ),*/
          displayMode: appTheme.displayMode,
          indicator: () {
            switch (appTheme.indicator) {
              case NavigationIndicators.end:
                return const EndNavigationIndicator();
              case NavigationIndicators.sticky:
              default:
                return const StickyNavigationIndicator();
            }
          }(),
          items: items,
          autoSuggestBox: TextBox(
            key: key,
            controller: searchController,
            placeholder: '搜索',
            focusNode: searchFocusNode,
          ),
          autoSuggestBoxReplacement: const Icon(FluentIcons.search),
          footerItems: searchValue.isNotEmpty ? [] : footerItems),
      onOpenSearch: () {
        searchFocusNode.requestFocus();
      },
    );
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
          context: context,
          builder: (_) {
            return ContentDialog(
              title: const Text('确认关闭'),
              content: const Text('确定要关闭窗口吗？'),
              actions: [
                FilledButton(
                    child: const Text('确定'),
                    onPressed: () {
                      Navigator.pop(context);
                      windowManager.destroy();
                    }),
                Button(
                    child: const Text('取消'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }
  }

  List<NavigationPaneItem> _getNavigationPane() {
    return [
      PaneItem(
        icon: const Icon(FluentIcons.home),
        title: const Text('首页'),
        body: HomePage(),
      )
    ];
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    return SizedBox(
      width: 138,
      height: 50,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

/*

import 'dart:io';

void main() {
  String bookmarksFilePath =
      "C:\\Users\\agoy\\AppData\\Local\\Google\\Chrome\\User Data\\Default\\Bookmarks";

  File file = File(bookmarksFilePath);
  String text = file.readAsStringSync();
  print(text);
}

 */
