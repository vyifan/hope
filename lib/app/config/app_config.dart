import 'package:fluent_ui/fluent_ui.dart';

import '../../screens/index.dart';

class AppConfig {
  // 底部菜单
  static final List<NavigationPaneItem> footerItems = [
    PaneItemSeparator(),
    PaneItem(
        icon: const Icon(FluentIcons.image_pixel),
        title: const Text('ChatGPT'),
        body: const CompressPage()),
    PaneItem(
        icon: const Icon(FluentIcons.image_pixel),
        title: const Text('图片压缩'),
        body: const CompressPage()),
    PaneItem(
        icon: const Icon(FluentIcons.add),
        title: const Text('添加应用'),
        body: AppPage()),
    PaneItem(
        icon: const Icon(FluentIcons.settings),
        title: const Text('设置'),
        body: Settings())
  ];
}
