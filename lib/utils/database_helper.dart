import 'package:pharmacia/models/newaddress_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String addressTable = 'address_table';
  String colId = 'id';
  String colName = 'name';
  String colNotes = 'notes';
  String colLabel = 'label';
  String colAddress = 'address';
  String colPhonenum = 'phonenum';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'address.db';

    var addressesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return addressesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $addressTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, '
        '$colNotes TEXT, $colLabel TEXT, $colAddress TEXT, $colPhonenum TEXT)');
  }

  // Fetch Operation: Get all address objects from database
  Future<List<Map<String, dynamic>>> getAddressMapList() async {
    Database db = await this.database;
    var result = await db.query(addressTable, orderBy: '$colId ASC');
    return result;
  }

  // Insert Operation: Insert a address object to database
  Future<int> insertAddress(Address address) async {
    Database db = await this.database;
    var result = await db.insert(addressTable, address.toMap());
    return result;
  }

  // Update Operation: Update a address object and save it to database
  Future<int> updateAddress(Address address) async {
    var db = await this.database;
    var result = await db.update(addressTable, address.toMap(), where: '$colId = ?', whereArgs: [address.id]);
    return result;
  }

  // Delete Operation: Delete a address object from database
  Future<int> deleteAddress(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $addressTable WHERE $colId = $id');
    return result;
  }

  // Get number of address objects in database
  Future<int?> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $addressTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Address List' [ List<Address> ]
  Future<List<Address>> getAddressList() async {
    var addressMapList = await getAddressMapList(); // Get 'Map List' from database
    int count = addressMapList.length;         // Count the number of map entries in db table

    List<Address> addressList = [];
    // For loop to create a 'Address List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      addressList.add(Address.fromMapObject(addressMapList[i]));
    }
    return addressList;
  }
}