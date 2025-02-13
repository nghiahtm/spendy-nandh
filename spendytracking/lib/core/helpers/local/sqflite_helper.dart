import 'package:path/path.dart';
import 'package:spendytracking/data/models/base_model.dart';
import 'package:sqflite/sqflite.dart';

mixin SQFLiteManagement<T> {
  Future<void> create(
      {required String table, required String createQueryTable});
  Future<void> update({required String table, required BaseModel<T> t});
  Future<void> deleteOnlyOne({required String table, required BaseModel<T> t});
  Future<int> add({required String table, required BaseModel<T> t});
  Future<T?> getById(
      {required String table,
      required int id,
      required T Function(Map<String, dynamic>) fromJson});
}

class SQFLiteHelper<T> with SQFLiteManagement<T> {
  late Database db;

  Future<SQFLiteHelper<T>> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'project.db');
    db = await openDatabase(path, version: 1);
    return this;
  }

  Future<bool> _isTableExists(String tableName) async {
    final List<Map<String, dynamic>> result = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
        [tableName]);

    return result.isNotEmpty;
  }

  @override
  Future<void> create(
      {required String table, required String createQueryTable}) async {
    assert(createQueryTable.isNotEmpty, "need query param");
    if (await _isTableExists(table)) return;
    await db.execute('''
        create table $table ( 
       $createQueryTable
       )
      ''');
  }

  @override
  Future<void> update({required String table, required BaseModel<T> t}) async {
    await db.update(table, t.toJson(), where: "id = ?", whereArgs: [t.id]);
  }

  @override
  Future<int> add({required String table, required BaseModel<T> t}) async {
   final id =  await db.insert(
      table,
      t.toJson(),
    );
    return id;
  }

  @override
  Future<void> deleteOnlyOne(
      {required String table, required BaseModel<T> t}) async {
    // TODO: implement delete
    await db.delete(
      table,
      where: "id = ?",
      whereArgs: [t.id],
    );
  }

  @override
  Future<T?> getById(
      {required String table,
      required int id,
      required T Function(Map<String, dynamic>) fromJson}) async {
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return fromJson(maps.first);
    }
    return null;
  }
}
