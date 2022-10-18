import 'package:fairyland_shortcuts/utils/windows/entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    return _buildAppShortcuts();
  }

  Widget _buildAppShortcuts() {
    RegistryUtil.getInstalledApps();
    List<InstallApp> apps =
        RegistryUtil.installApps.entries.map((e) => e.value).toList();
    return ScaffoldPage.scrollable(children: apps.map((e) => _buildApp(e)).toList());
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
                      isClick ? Color(0xFFf4f3ec) : Colors.transparent),
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
                                    color:
                                    isClick ? Colors.red : Colors.transparent,
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
