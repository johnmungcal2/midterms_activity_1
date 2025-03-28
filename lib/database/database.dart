import 'package:isar/isar.dart';
import 'package:lesson_5/model/user.dart';
import 'package:path_provider/path_provider.dart';

late final Isar isar;

Future<void> setupIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open([UserSchema], directory: dir.path);
}

Future<void> printAllUsers() async {
  final users = await isar.users.where().findAll();
  for (var user in users) {
    print('Username: ${user.username}, Password: ${user.password}');
  }
}
