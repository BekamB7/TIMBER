import 'dart:io';

import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../data/local/database.dart';
import '../../../../data/local/database_provider.dart';

/// ═══════════════════════════════════════════════════════════════
/// Horizontal row of favorite files (thumbnails).
/// Empty state → shows a "no favorites yet" hint card.
/// ═══════════════════════════════════════════════════════════════
class FavoritesRow extends ConsumerWidget {
  const FavoritesRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    final stream = (db.select(db.mediaFiles)
          ..where((t) => t.isFavorite.equals(true) & t.deletedAt.isNull())
          ..orderBy([(t) => OrderingTerm.desc(t.lastModified)])
          ..limit(20))
        .watch();

    return StreamBuilder<List<MediaFile>>(
      stream: stream,
      builder: (context, snapshot) {
        final files = snapshot.data ?? const <MediaFile>[];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Favorites', style: AppTypography.titleLarge),
                  if (files.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        // TODO: navigate to favorites (Module 5)
                      },
                      child: Text(
                        'See all',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            if (files.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: _EmptyFavorites(),
              )
            else
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xl,
                  ),
                  itemCount: files.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: AppSpacing.sm),
                  itemBuilder: (context, index) {
                    return _FavoriteTile(file: files[index]);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  const _FavoriteTile({required this.file});

  final MediaFile file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to viewer (Module 7)
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Container(
          width: 90,
          height: 90,
          color: AppColors.card,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (file.mediaType == 0)
                Image.file(
                  File(file.filePath),
                  fit: BoxFit.cover,
                  cacheWidth: 300,
                  errorBuilder: (_, __, ___) => _PlaceholderTile(),
                )
              else
                _VideoThumbnail(path: file.filePath),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.75),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.star_rounded,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaceholderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.card,
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: AppColors.textDim,
        size: 28,
      ),
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  const _VideoThumbnail({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.elevated,
      child: const Center(
        child: Icon(
          Icons.play_circle_fill,
          color: AppColors.primary,
          size: 32,
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.divider.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_outline,
              color: AppColors.textMuted, size: 22),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              'Tap the star on any file to see it here.',
              style: AppTypography.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
