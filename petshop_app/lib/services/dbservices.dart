import 'package:hive/hive.dart';

class HiveService {

   late Box box;

  HiveService(String boxName) {
    openBox(boxName);
  }

  
  
  Future<void> openBox(String boxName) async {
    box = await Hive.openBox(boxName);
  }

   void put(String key, dynamic value) {
    box.put(key, value);
  }

   dynamic get(String key) {
    return box.get(key);
  }

   Map<String, dynamic> getAll() {
    final keys = box.keys;
    Map<String, dynamic> data = {};
    for (var key in keys) {
      data[key as String] = box.get(key);
    }
    return data;
  }

  // Additional methods for delete, etc.
}

