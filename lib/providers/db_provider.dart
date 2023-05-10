import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_cricket/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbProvider {
  static Database? _database;
  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database?> get database async {
    if(_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //554154-16517741-15614
    final path = join(documentsDirectory.path, 'ScansDB.db');

    print(path);

    return await openDatabase(
      path, 
      version: 1, 
      onOpen: (_){}, 
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''');
      }
    );
  }

  newScanRow( ScanModel scanModel ) async {

    final id = scanModel.id;
    final tipo = scanModel.tipo;
    final valor = scanModel.valor;

    final db = await database;
    final res = await db!.rawInsert('''
      INSERT INTO Scans(id, tipo, valor)
      VALUES($id, '$tipo' '$valor')
    ''');
    return res;
  }

  newScan( ScanModel scanModel ) async {
    final db = await database;
    final res = await db!.insert('Scans', scanModel.toJson());
    return res;
  }

  getScanById( int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty
    ? ScanModel.fromJson(res.first)
    : null;
  }

  getScans() async{
    final db = await database;
    final res = await db!.query('Scans');

    return res.isNotEmpty
      ? res.map((e) => ScanModel.fromJson(e)).toList()
      : null;
  }

  getScansByType( String tipo ) async {
    final db = await database;
    final List<Map<String, dynamic>> res = await db!.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);
    return List.generate(
      res.length, 
      (i)=> ScanModel(
        id: res[i]['id'],
        valor: res[i]['valor'],
        tipo: res[i]['tipo']
      )
    );
  }

  updateScan( ScanModel scanModel) async { 
    final db = await database;
    final res = await db!.update('Scans', scanModel.toJson(), where: 'id = ?', whereArgs: [scanModel.id]);
    return res;
  }

  Future<int> deleteScan( int id ) async {
    final db = await database;
    final res = await db!.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteScans() async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM Scans WHERE tipo = ? or tipo = ?', ['http', 'geo']);
    return res;
  }
}