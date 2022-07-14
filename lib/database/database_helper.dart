import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const dataBaseName = "sozluk.sqlite";

  static Future<Database> dataBaseAccess() async {
    String dataBaseRoute = join(await getDatabasesPath(), dataBaseName);

    if (await databaseExists(dataBaseRoute)) {
    } else {
      ByteData data = await rootBundle.load("database/$dataBaseName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dataBaseRoute).writeAsBytes(bytes, flush: true);
    }
    return openDatabase(dataBaseRoute);
  }
}
