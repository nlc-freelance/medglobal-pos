import 'dart:io';

Future<String?> getSystemUUID() async {
  try {
    final result = await Process.run('wmic', ['csproduct', 'get', 'uuid']);
    final lines = result.stdout.toString().trim().split('\n');
    if (lines.length >= 2) {
      // return lines[1].trim().substring(1, 17).replaceAll('-', '');
      return lines[1].trim().substring(0, 16).replaceAll('-', '');
    }
  } catch (_) {}
  return null;
}
