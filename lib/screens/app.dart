import 'package:fluent_ui/fluent_ui.dart';

import '../widgets/page.dart';

class AppPage extends ScrollablePage {
  AppPage({super.key});

  late final items = [
    TreeViewItem(
      content: const Text('Personal Documents'),
      value: 'personal_docs',
    ),
  ];

  @override
  Widget buildHeader(BuildContext context) {
    return const PageHeader(title: Text('应用选择'));
  }

  @override
  List<Widget> buildScrollable(BuildContext context) {
    return [
      TreeView(
        shrinkWrap: true,
        items: items,
        onItemInvoked: (item) async {
          //debugPrint('onItemInvoked: $item')
        },
        onSelectionChanged: (selectedItems) async {
          // debugPrint(
          //     'onSelectionChanged: ${selectedItems.map((i) => i.value)}');
        },
        onSecondaryTap: (item, details) async {
          //debugPrint('onSecondaryTap $item at ${details.globalPosition}');
        },
      ),
    ];
  }

  List<Widget> _buildApps() {
    return [];
  }
}
