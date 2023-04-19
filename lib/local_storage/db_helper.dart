import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static const _DATA_BASE_NAME = "spacerocket.db";
  static const _DATA_BASE_VERSION = 2;
  static const _TABLE = 'srocket';

  static const COLUMN_SPACEID = 'space_id';
  static const COLUMN_HEIGHT= 'height';
  static const COLUMN_DIAMETER= 'diameter';
  static const COLUMN_IMAGE = 'flickr_images';
  static const COLUMN_NAME = 'name';
  static const COLUMN_ACTIVESTATUS = 'active';
  static const COLUMN_COUNTRY = 'country';
  static const COLUMN_COMPANY = 'company';
  static const COLUMN_LINK = 'wikipedia';
  static const COLUMN_COST = 'cost_per_launch';
  static const COLUMN_SUCCESSRATE = 'success_rate_pct';
  static const COLUMN_DESCRIPTION = 'description';
  static const COLUMN_ENGINE_COUNT = 'number';

  // make this a singleton class
  DbHelper._();
  static final DbHelper instance = DbHelper._();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_TABLE (
            $COLUMN_SPACEID TEXT,
            $COLUMN_HEIGHT INTEGER,
            $COLUMN_DIAMETER INTEGER,
            $COLUMN_IMAGE TEXT,
            $COLUMN_COMPANY TEXT,
            $COLUMN_NAME TEXT,
            $COLUMN_ACTIVESTATUS BOOLEAN,
            $COLUMN_COUNTRY TEXT,
            $COLUMN_LINK TEXT,
            $COLUMN_COST INTEGER,
            $COLUMN_SUCCESSRATE INTEGER,
            $COLUMN_DESCRIPTION TEXT,
            $COLUMN_ENGINE_COUNT INTEGER
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int?> insert(Map<String, dynamic> row) async {

    Database? db = await instance.database;

    await deleterocketlits();


    return await db?.insert(_TABLE,row );
  }
  Future<int?> deleterocketlits() async {

    Database? db = await instance.database;

    return await db?.delete(_TABLE);
  }
  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    print(db?.query(_TABLE));


    return await db?.query(_TABLE);



  }



  // Future<List> getAllEmployees() async {
  //   final db = await database;
  //   final res = await db?.rawQuery("SELECT * FROM how_iq_work");
  //
  //   List<HowIqWorks> list =
  //   res.isNotEmpty ? res.map((c) => HowIqWorks.fromJson(c)).toList() : [];
  //
  //   return list;
  // }
}