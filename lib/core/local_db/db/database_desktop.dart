import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

/// Native implementation of [connect] for desktop platforms using Drift.
///
/// This sets up a local SQLite database under:
///   `C:\Users\<User>\AppData\Roaming\MedGlobal_POS\mg_pos.sqlite`
///
/// It ensures the target directory exists before opening the database,
/// and uses a background connection for non-blocking access. SQL logs
/// are enabled for development and debugging.
DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    final userHome = Platform.environment['USERPROFILE']!;
    final dir = Directory(p.join(userHome, 'AppData', 'Roaming', 'MedGlobal_POS'));

    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final file = File(p.join(dir.path, 'app.sqlite'));
    print('📁 Drift DB path: ${file.path}');

    return NativeDatabase.createBackgroundConnection(file, logStatements: true);
  }));
}
