import 'dart:io';

/// Retrieves the device BIOS UUID
Future<String?> getDeviceUUID() async {
  try {
    final result = await Process.run('wmic', ['csproduct', 'get', 'uuid']);
    final lines = result.stdout.toString().trim().split('\n');
    if (lines.length >= 2) {
      return lines[1].trim();
    }
  } catch (_) {}
  return null;
}
