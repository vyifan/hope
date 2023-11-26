import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

import '../../screens/index.dart';

class AppConfig {
  // 底部菜单
  static final List<NavigationPaneItem> originalItems = [
    PaneItemSeparator(),
    PaneItem(
      key: const ValueKey('/chat'),
      icon: const Icon(FluentIcons.image_pixel),
      title: const Text('ChatGPT'),
      body: const SizedBox.shrink(),
    ),
    PaneItem(
      key: const ValueKey('/compress'),
      icon: const Icon(FluentIcons.image_pixel),
      title: const Text('图片压缩'),
      body: const SizedBox.shrink(),
    ),
    PaneItem(
        key: const ValueKey('/app'),
        icon: const Icon(FluentIcons.add),
        title: const Text('添加应用'),
        body: const SizedBox.shrink()),

    // PaneItem(
    //     key: const ValueKey('/settings'),
    //     icon: const Icon(FluentIcons.settings),
    //     title: const Text('设置'),
    //     body: Settings())
  ];

  static List<NavigationPaneItem> getFooterItems(context) {
    return <NavigationPaneItem>[
      PaneItemSeparator(),
      PaneItem(
          key: const ValueKey('/settings'),
          icon: const Icon(FluentIcons.settings),
          title: const Text('Settings'),
          body: const SizedBox.shrink(),
          onTap: () {
            if (GoRouterState.of(context).uri.toString() != '/settings') {
              context.go('/compress');
            }
          }),
      _LinkPaneItemAction(
        icon: const Icon(FluentIcons.open_source),
        title: const Text('Source code'),
        link: 'https://github.com/bdlukaa/fluent_ui',
        body: const SizedBox.shrink(),
      ),
    ];
  }
}

class _LinkPaneItemAction extends PaneItem {
  _LinkPaneItemAction({
    required super.icon,
    required this.link,
    required super.body,
    super.title,
  });

  final String link;

  @override
  Widget build(
    BuildContext context,
    bool selected,
    VoidCallback? onPressed, {
    PaneDisplayMode? displayMode,
    bool showTextOnTop = true,
    bool? autofocus,
    int? itemIndex,
  }) {
    return Link(
      uri: Uri.parse(link),
      builder: (context, followLink) => Semantics(
        link: true,
        child: super.build(
          context,
          selected,
          followLink,
          displayMode: displayMode,
          showTextOnTop: showTextOnTop,
          itemIndex: itemIndex,
          autofocus: autofocus,
        ),
      ),
    );
  }
}
