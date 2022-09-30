import 'package:fairyland_shortcuts/models/database/database.dart';
import 'package:fairyland_shortcuts/models/repository/tag_repository.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
void setup(){
  final database=Database();
  getIt.registerSingleton<Database>(database);
  getIt.registerSingleton<TagRepository>(TagRepository(database));
}