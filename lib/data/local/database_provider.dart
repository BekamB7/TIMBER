import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database.dart';

/// ═══════════════════════════════════════════════════════════════
/// Exposes the AppDatabase to the whole app.
/// `ref.read(databaseProvider)` → use once (e.g., in a button onTap).
/// `ref.watch(databaseProvider)` → rebuild on change (rare for DB itself).
/// The database is closed when the ProviderScope is disposed.
/// ═══════════════════════════════════════════════════════════════
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
