import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Native implementation of [connect] for desktop platforms using Drift.
///
/// This sets up a local SQLite database under:
///   On Windows → C:\Users\<User>\AppData\Local\<YourApp>\
///   On macOS   → ~/Library/Application Support/<YourApp>/
///   On Linux   → ~/.local/share/<YourApp>/
///
/// It ensures the target directory exists before opening the database,
/// and uses a background connection for non-blocking access. SQL logs
/// are enabled for development and debugging.
DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    final localAppData = Platform.environment['LOCALAPPDATA']!;
    final dir = Directory(p.join(localAppData, 'MedGlobal_POS'));

    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final file = File(p.join(dir.path, 'pos.db'));
    print('📁 Drift DB path: ${file.path}');

    return NativeDatabase.createBackgroundConnection(file, logStatements: true);
  }));
}
