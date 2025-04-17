import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late final Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create your tables here
        await db.execute('''
          CREATE TABLE movies (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            director TEXT,
            releaseYear INTEGER
          )
        ''');
      },
    );
  }

  static Future<int> insertMovie(Map<String, dynamic> movie) async {
    final db = await database;
    return await db.insert(
      'movies',
      movie,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertMoviesBatch(List<Map<String, dynamic>> movies) async {
    final db = await database;
    Batch batch = db.batch();
    for (var movie in movies) {
      batch.insert(
        'movies',
        movie,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  static Future<List<Map<String, dynamic>>> getMovies() async {
    final db = await database;
    return await db.query('movies');
  }

  static Future<int> deleteMovie(int id) async {
    final db = await database;
    return await db.delete('movies', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> closeDatabase() async {
    final db = await database;
    if (db.isOpen) {
      await db.close();
    }
  }
}

// singlton principle
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   // Factory constructor to return the same instance
//   factory DatabaseHelper() => _instance;

//   // Private constructor
//   DatabaseHelper._();
//   // Singleton instance
//   static final DatabaseHelper _instance = DatabaseHelper._();

//   late final Database? _database; // Lazy initialization of the database

//   // Get the database instance (Ensures only one connection)
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database;
//     }
//     else
//     {_database = await _initDatabase();
//     return _database!;}
//   }

//   // Initialize the database
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'app_database.dbc');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         // Create your tables here
//         await db.execute('''
//           CREATE TABLE movies (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT,
//             director TEXT,
//             releaseYear INTEGER
//           )
//         ''');
//       },
//     );
//   }

//   // Insert a single record (movie)
//   Future<int> insertMovie(Map<String, dynamic> movie) async {
//     final db = await database;
//     return await db.insert(
//       'movies',
//       movie,
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   // Insert multiple movies using Batch (for better performance)
//   Future<void> insertMoviesBatch(List<Map<String, dynamic>> movies) async {
//     final db = await database;
//     Batch batch = db.batch();
//     for (var movie in movies) {
//       batch.insert(
//         'movies',
//         movie,
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     await batch.commit(noResult: true);
//   }

//   // Get all movies
//   Future<List<Map<String, dynamic>>> getMovies() async {
//     final db = await database;
//     return await db.query('movies');
//   }

//   // Get a movie by its ID
//   Future<Map<String, dynamic>?> getMovieById(int id) async {
//     final db = await database;
//     final result = await db.query('movies', where: 'id = ?', whereArgs: [id]);
//     return result.isNotEmpty ? result.first : null;
//   }

//   // Update a movie
//   Future<int> updateMovie(int id, Map<String, dynamic> movie) async {
//     final db = await database;
//     return await db.update('movies', movie, where: 'id = ?', whereArgs: [id]);
//   }

//   // Delete a movie by ID
//   Future<int> deleteMovie(int id) async {
//     final db = await database;
//     return await db.delete('movies', where: 'id = ?', whereArgs: [id]);
//   }

//   // Close the database safely
//   Future<void> closeDatabase() async {
//     final db = await database;
//     if (db.isOpen) {
//       await db.close();
//     }
//   }
// }
