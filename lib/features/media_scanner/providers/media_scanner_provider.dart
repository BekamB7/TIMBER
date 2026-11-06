import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/database_provider.dart';
import '../data/media_scanner_service.dart';

/// ═══════════════════════════════════════════════════════════════
/// Exposes the MediaScannerService to the app.
/// ═══════════════════════════════════════════════════════════════
final mediaScannerProvider = Provider<MediaScannerService>((ref) {
  final db = ref.watch(databaseProvider);
  return MediaScannerService(db);
});

/// ═══════════════════════════════════════════════════════════════
/// Holds the current scan status so screens can react to it.
/// ═══════════════════════════════════════════════════════════════
class ScanState {
  const ScanState({
    this.isScanning = false,
    this.processed = 0,
    this.total = 0,
    this.result,
    this.error,
  });

  final bool isScanning;
  final int processed;
  final int total;
  final ScanResult? result;
  final String? error;

  double get progress => total == 0 ? 0 : processed / total;

  ScanState copyWith({
    bool? isScanning,
    int? processed,
    int? total,
    ScanResult? result,
    String? error,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return ScanState(
      isScanning: isScanning ?? this.isScanning,
      processed: processed ?? this.processed,
      total: total ?? this.total,
      result: clearResult ? null : (result ?? this.result),
      error: clearError ? null : (error ?? this.error),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════
/// StateNotifier that runs the scan and reports progress.
/// Screens call `ref.read(scanControllerProvider.notifier).startScan()`.
/// ═══════════════════════════════════════════════════════════════
final scanControllerProvider =
    StateNotifierProvider<ScanController, ScanState>((ref) {
  return ScanController(ref);
});

class ScanController extends StateNotifier<ScanState> {
  ScanController(this._ref) : super(const ScanState());

  final Ref _ref;

  Future<void> startScan() async {
    if (state.isScanning) return;

    state = const ScanState(isScanning: true);

    try {
      final scanner = _ref.read(mediaScannerProvider);

      // Request permission
      final hasPermission = await scanner.requestPermission();
      if (!hasPermission) {
        state = state.copyWith(
          isScanning: false,
          error: 'Gallery permission denied',
        );
        return;
      }

      // Run scan
      final result = await scanner.scanAll(
        onProgress: (processed, total) {
          if (!mounted) return;
          state = state.copyWith(processed: processed, total: total);
        },
      );

      state = state.copyWith(
        isScanning: false,
        result: result,
        processed: 0,
        total: 0,
      );
    } catch (e) {
      state = state.copyWith(
        isScanning: false,
        error: e.toString(),
      );
    }
  }
}
