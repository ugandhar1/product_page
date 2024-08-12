import 'package:flutter1/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'product_cart.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY,
        name TEXT,
        imageUrl TEXT,
        price REAL,
        quantity INTEGER
      )
    ''');
  }

  Future<void> insertCartProduct(Product product, int quantity) async {
    final db = await database;
    await db.insert(
      'cart',
      {
        'id': product.id,
        'name': product.name,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'quantity': quantity,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getCartProducts() async {
    final db = await database;
    return await db.query('cart');
  }

  Future<void> removeCartProduct(int id) async {
    final db = await database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateCartProduct(int id, int quantity) async {
    final db = await database;
    await db.update(
      'cart',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }


    Future<List<Map<String, dynamic>>> searchCartProducts(String query) async {
    final db = await database;
    return await db.query(
      'cart',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
  }
}
