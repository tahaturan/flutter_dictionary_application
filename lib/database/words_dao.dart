import 'package:flutter_dictionary_application/database/database_helper.dart';
import 'package:flutter_dictionary_application/model/words.dart';

class WordsDao {
  static Future<List<Words>> allWords() async {
    var db = await DataBaseHelper.dataBaseAccess();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kelimeler");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Words(line["kelime_id"], line["ingilizce"], line["turkce"]);
    });
  }

  static Future<List<Words>> searcWord(String searchWord) async {
    var db = await DataBaseHelper.dataBaseAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM kelimeler WHERE ingilizce like '%$searchWord%'");

    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Words(line["kelime_id"], line["ingilizce"], line["turkce"]);
    });
  }
}
