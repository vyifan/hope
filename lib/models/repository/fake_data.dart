import 'package:fairyland_shortcuts/models/repository/tag_repository.dart';
import 'package:fairyland_shortcuts/routes/domain.dart';
import 'package:fairyland_shortcuts/startup.dart';
import 'package:fairyland_shortcuts/utils/util_index.dart';

class FakeData {
  static Future<void> fake() async {
    getIt<TagRepository>().insert(TagViewModel.create(name: '浏览器3', type: TagType.shortcut));
    // Tag browserTag = Tag.create(name: '浏览器', type: TagType.shortcut);
    //
    // App chrome = App.create(
    //     name: 'Google Chrome',
    //     icon: 'https://pp.myapp.com/ma_icon/0/icon_74260_1609923779/256',
    //     tags: null,
    //     shortcuts: null);
    //chrome.tags = HiveList(tags);
    //chrome.tags?.add(browserTag);

    //box.put((App).toString(), [chrome]);

    //chrome.save();
    //box.put((Tag).toString(), [browseTag]);
    //browseTag.save();
    //print(chrome.runtimeType.toString());
    //var test = box.get((Tag).toString());


    var a = 1;
  }
}
