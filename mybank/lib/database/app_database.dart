import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/contact_dao.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'mybank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
//    onDowngrade: onDatabaseDowngradeDelete
  );
}