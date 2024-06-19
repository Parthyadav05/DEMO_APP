import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'home_model.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'events_database.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE events (
            id TEXT PRIMARY KEY,
            userId TEXT,
            description TEXT,
            title TEXT,
            image TEXT,
            tags TEXT,
            likedUsers TEXT,
            eventCategory TEXT,
            eventStartAt TEXT,
            eventEndAt TEXT,
            eventId TEXT,
            registrationRequired INTEGER,
            registration TEXT,
            eventDescription TEXT,
            likes INTEGER,
            comments TEXT,
            createdAt TEXT,
            v INTEGER,
            eventLocation TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<void> insertEvent(Model event) async {
    final db = await database;
    await db.insert(
      'events',
      event.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('Event inserted: ${event.id}');
  }

  static Future<void> updateEvent(Model event) async {
    final db = await database;
    await db.update(
      'events',
      event.toJson(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }

  static Future<void> deleteEvent(String id) async {
    final db = await database;
    await db.delete(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<Model?> getEvent(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'events',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Model.fromJson(maps.first);
    } else {
      return null;
    }
  }

  static Future<List<Model>> getAllEvents() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('events');

    return List.generate(maps.length, (i) {
      return Model.fromJson(maps[i]);
    });
  }

}
