import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// ═══════════════════════════════════════════════════════════════
/// A circular progress ring showing storage used.
/// Draws with CustomPainter for full control over style.
/// ═══════════════════════════════════════════════════════════════
class StorageRing extends StatelessWidget {
  const StorageRing({
    super.key,
    required this.usedBytes,
    required this.totalBytes,
    this.size = 140,
  });

  final int usedBytes;
  final int totalBytes;
  final double size;

  double get _progress {
    if (totalBytes <= 0) return 0;
    return (usedBytes / totalBytes).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final percent = (_progress * 100).round();

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The ring itself
          CustomPaint(
            size: Size.square(size),
            painter: _RingPainter(progress: _progress),
          ),
          // Center text (percent + "used")
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$percent%',
                style: AppTypography.numberLarge.copyWith(
                  fontSize: 32,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 2),
              Text('used', style: AppTypography.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════
/// The painter that draws the ring.
/// ═══════════════════════════════════════════════════════════════
class _RingPainter extends CustomPainter {
  _RingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 12.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // 1. Draw background track (dim ring)
    final trackPaint = Paint()
      ..color = AppColors.divider
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, math.pi * 2, false, trackPaint);

    // 2. Draw progress arc (oak color)
    if (progress > 0) {
      final progressPaint = Paint()
        ..shader = const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      // Start at top (-90° = -π/2) and sweep based on progress
      canvas.drawArc(
        rect,
        -math.pi / 2,
        math.pi * 2 * progress,
        false,
        progressPaint,
      );

      // 3. Add a small "glow" dot at the end of the arc
      final angle = -math.pi / 2 + (math.pi * 2 * progress);
      final dotCenter = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );

      final glowPaint = Paint()..color = AppColors.primary.withValues(alpha: 0.4);
      canvas.drawCircle(dotCenter, 10, glowPaint);
      canvas.drawCircle(dotCenter, 5, Paint()..color = AppColors.primary);
    }
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
