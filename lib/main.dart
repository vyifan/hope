import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:hope/screens/settings.dart';
import 'package:hope/startup.dart';
import 'package:provider/provider.dart';
import 'package:system_theme/system_theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:window_manager/window_manager.dart';

import 'screens/app.dart';
import 'screens/compress.dart';
import 'screens/home.dart';
import 'theme.dart';
import 'utils/platform_util.dart';

const String appTitle = 'Lunk Box';

/// Checks if the current environment is a desktop environment.
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb &&
      [
        TargetPlatform.windows,
        TargetPlatform.android,
      ].contains(defaultTargetPlatform)) {
    SystemTheme.accentColor.load();
  }

  setup();
  /*await database.into(database.tagTable)
      .insert(TagTableCompanion.insert(name: '浏览器', type: TagType.shortcut));

  var tag = database.select(database.tagTable).get();
  print(tag);*/

  //await FakeData.fake();

  setPathUrlStrategy();

  if (isDeskTop) {
    await flutter_acrylic.Window.initialize();
    await flutter_acrylic.Window.hideWindowControls();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden,
          windowButtonVisibility: false);
      await windowManager.setSize(const Size(1200, 768));
      await windowManager.setMinimumSize(const Size(1200, 768));
      await windowManager.center();
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppTheme(),
        builder: (context, _) {
          final appTheme = context.watch<AppTheme>();
          return FluentApp(
            title: appTitle,
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
            routes: {'/': (context) => const MyHomePage()},
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  bool value = false;
  int index = 0;
  final viewKey = GlobalKey();
  final key = GlobalKey();
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  void resetSearch() => searchController.clear();

  String get searchValue => searchController.text;
  late List<NavigationPaneItem> originalItems;

  // 底部菜单
  final List<NavigationPaneItem> footerItems = [
    PaneItemSeparator(),
    PaneItem(
        icon: const Icon(FluentIcons.image_pixel),
        title: const Text('ChatGPT'),
        body: CompressPage()),
    PaneItem(
        icon: const Icon(FluentIcons.image_pixel),
        title: const Text('图片压缩'),
        body: CompressPage()),
    PaneItem(
        icon: const Icon(FluentIcons.add),
        title: const Text('添加应用'),
        body: AppPage()),
    PaneItem(
        icon: const Icon(FluentIcons.settings),
        title: const Text('设置'),
        body: Settings())
  ];

  late List<NavigationPaneItem> items = originalItems;

  _MyHomePageState() {
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
                child: Text(appTitle),
              );
            }
            return const DragToMoveArea(
                child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(appTitle),
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
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
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
