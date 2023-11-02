import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';
import 'package:hope/utils/windows/entity.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../utils/windows/win32_util.dart';
import '../widgets/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with PageMixin {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    //return _buildAppShortcuts();
    return m.Material(
      child: const ExpansionTile(
        title: Text('Colors'),
        subtitle: Text('Expand this tile to see its contents'),
        // Contents
        children: [
          m.ListTile(
              leading: CircleAvatar(
                backgroundColor: m.Colors.blue,
              ),
              title: Text('Blue')),
          m.ListTile(
              leading: CircleAvatar(
                backgroundColor: m.Colors.red,
              ),
              title: Text('Red')),
          m.ListTile(
              leading: CircleAvatar(
                backgroundColor: m.Colors.amber,
              ),
              title: Text('Amber')),
        ],
      ),
    );
  }

  Widget _buildAppShortcuts() {
    RegistryUtil.getInstalledApps();
    List<InstallApp> apps =
        RegistryUtil.installApps.entries.map((e) => e.value).toList();
    return ScaffoldPage.scrollable(
        children: apps.map((e) => _buildApp(e)).toList());
  }

  Widget _buildApp(InstallApp app) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Text(app.displayName!,
              style: FluentTheme.of(context).typography.subtitle),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isClick = !isClick;
            });
          },
          child: MouseRegion(
            onEnter: (v) {
              setState(() {
                isClick = true;
              });
              //print(v);
            },
            onExit: (v) {
              setState(() {
                isClick = false;
              });
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color:
                          isClick ? Color(0xFFf4f3ec) : m.Colors.transparent),
                  child: Row(children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: isClick
                                    ? m.Colors.red
                                    : m.Colors.transparent,
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          Text('Ctrl+T')
                        ],
                      ),
                    )),
                    Expanded(child: Text('Open new tab')),
                    Expanded(child: Text('browser productivity'))
                  ]),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

final treeViewItems = [
  TreeViewItem(content: const Text('Option 1')),
  TreeViewItem(content: const Text('Option 2')),
  TreeViewItem(content: const Text('Option 3')),
];
