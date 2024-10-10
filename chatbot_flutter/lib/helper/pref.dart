// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';

// class Pref {
//   static late Box _box;

//   static Future<void> initialize() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     final dir = await getApplicationDocumentsDirectory();
//     Hive.defaultDirectory = dir.path;

//     _box = Hive.box();
//   }

//   static bool get showOnboarding =>
//       _box.get("showOnboarding", defaultValue: true);
//   static set showOnboarding(bool v) => _box.put("showOnboarding", v);
// }
