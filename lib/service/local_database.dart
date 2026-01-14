import 'package:sec_med_rem/model/medicine_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MedicineDB{
static final MedicineDB instance = MedicineDB._init();
static Database? _database;

MedicineDB._init();

// getter
Future<Database> get database async{
  if(_database != null) return _database!;
  _database = await _openDB();
  return _database!;

}
//pivate DB opner
Future<Database> _openDB() async{
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'medicine.db');
  return await openDatabase
  (path,
  version: 1,
  onCreate: _createDB,);
}

//create Db
Future<void> _createDB(Database db, int version) async{
  await db.execute('''
CREATE TABLE medicines(
     id INTEGER PRIMARY KEY ANTOINCREMENT,
     name TEXT NOT NULL,
     dose TEXT NOT NULL,
     time TEXTNOT NULL
  )
''');
}

 // Insert  
 Future<int> insertMedicine(MedicineModel medicine) async{
  final db = await database;
  return await db.insert('medicines', medicine.toMap());

 }

 //Get all medicines sorted by time
 Future<List<MedicineModel>> getMedicines() async{
 final db = await database;
 final result = await db.query('medicines', orderBy: 'time Asc');
 return result.map((map) => MedicineModel.fromMap(map)).toList(); 
 }
}

