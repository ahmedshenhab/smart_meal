import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();
  // Singleton setup
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
     
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            ingrediant TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE meal (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT UNIQUE
          )
        ''');
      },
    );
  }

  Future<void> insertName(String name) async {
    final db = await database;
    await db.insert(
      'meal',
       {
      'name': name, 
    },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartItem>> getAllNames() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('meal');
    return result.map((json) => CartItem.fromJson(json)).toList();
  }

  // Insert a list of ingredients with the same name
  Future<void> insertIngrediantsBatch(
    String name,
    List<String> ingrediants,
  ) async {
    final db = await database;
    final joined = ingrediants.join(', ');
    await db.insert(
      'cart',
      CartItem(name: name, ingrediant: joined).toJson(),

      // {
      //   'name': name,
      //   'ingrediant': joined,
      // },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all items from the cart table
  Future<List<CartItem>> getAllIngredients() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('cart');
    return result.map((json) => CartItem.fromJson(json)).toList();
  }

  deleteAll() async {
    final db = await database;
    db.delete('cart');
  }

  deleteRow(int id) async {
    final db = await database;
    db.delete('cart', where: 'id=?', whereArgs: [id]);
  }
}

class CartItem {
  CartItem({this.id, this.name, this.ingrediant});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      ingrediant: json['ingrediant'],
    );
  }
  final int? id;
  final String? name;
  final String? ingrediant;

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'ingrediant': ingrediant};
  }
}
