export 'database_unsupported.dart'
    if (dart.library.js) 'database_web.dart'
    if (dart.library.ffi) 'database_desktop.dart';

/// Conditional import for platform-specific database connection setup.
///
/// This file conditionally exports a different implementation based on the platform:
///
/// - On Web, exports `database_web.dart`, which contains web-safe database stubs or implementations.
/// - On Desktop, exports `database_desktop.dart`, which uses Drift with `dart:ffi`.
/// - On unsupported platforms, falls back to `database_unsupported.dart`, which throws UnsupportedError.
