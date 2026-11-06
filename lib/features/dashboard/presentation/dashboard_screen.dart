import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/route_names.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/widgets/timber_bottom_nav.dart';
import '../../../shared/widgets/wood_card.dart';
import '../data/dashboard_stats_provider.dart';
import 'widgets/category_card.dart';
import 'widgets/favorites_row.dart';
import 'widgets/storage_ring.dart';

/// ═══════════════════════════════════════════════════════════════
/// The Timber Dashboard — home screen.
/// Shows storage, category cards, favorites row.
/// ═══════════════════════════════════════════════════════════════
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(dashboardStatsProvider);

    return Scaffold(
      body: Stack(
        children: [
          // ─── SCROLLING CONTENT ───
          CustomScrollView(
            slivers: [
              // Top app bar area
              SliverToBoxAdapter(child: _buildHeader(context)),

              // Content sections
              SliverToBoxAdapter(
                child: statsAsync.when(
                  data: (stats) => _buildContent(context, stats),
                  loading: () => _buildLoading(),
                  error: (e, _) => _buildError(e.toString()),
                ),
              ),

              // Bottom padding to leave room for floating nav
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),

          // ─── FLOATING BOTTOM NAV ───
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: TimberBottomNav(),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // HEADER — "Good evening" + "Your Library" + avatar
  // ═══════════════════════════════════════════════════════════════
  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          AppSpacing.lg,
          AppSpacing.xl,
          AppSpacing.md,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_greeting(), style: AppTypography.bodySmall),
                  const SizedBox(height: AppSpacing.xs),
                  Text('Your Library', style: AppTypography.headlineLarge),
                ],
              ),
            ),
            _CircleIconButton(
              icon: Icons.notifications_none_rounded,
              onTap: () {},
            ),
            const SizedBox(width: AppSpacing.sm),
            _CircleIconButton(
              icon: Icons.person_outline_rounded,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }

  // ═══════════════════════════════════════════════════════════════
  // MAIN CONTENT
  // ═══════════════════════════════════════════════════════════════
  Widget _buildContent(BuildContext context, DashboardStats stats) {
    // Assume 32 GB total for the demo — we can read this from
    // device_info_plus in a future module.
    const totalDeviceBytes = 32 * 1024 * 1024 * 1024;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── STORAGE CARD ───
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: WoodCard(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                StorageRing(
                  usedBytes: stats.totalBytes,
                  totalBytes: totalDeviceBytes,
                  size: 120,
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_formatBytes(stats.totalBytes)} of '
                        '${_formatBytes(totalDeviceBytes)}',
                        style: AppTypography.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        stats.totalCount == 0
                            ? 'Scan to see your files'
                            : '${_formatCount(stats.totalCount)} files indexed',
                        style: AppTypography.bodySmall,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // Category mini-bar
                      _buildStorageSegments(stats, totalDeviceBytes),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),

        // ─── CATEGORY CARDS (2×2) ───
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories', style: AppTypography.titleLarge),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: CategoryCard(
                      icon: Icons.photo_outlined,
                      label: 'Images',
                      count: stats.imagesCount,
                      onTap: () => context.go(
                        '${RouteNames.mediaFeed}?category=images',
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: CategoryCard(
                      icon: Icons.videocam_outlined,
                      label: 'Videos',
                      count: stats.videosCount,
                      onTap: () => context.go(
                        '${RouteNames.mediaFeed}?category=videos',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: CategoryCard(
                      icon: Icons.download_outlined,
                      label: 'Downloads',
                      count: stats.downloadsCount,
                      onTap: () => context.go(
                        '${RouteNames.mediaFeed}?category=downloads',
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: CategoryCard(
                      icon: Icons.screenshot_outlined,
                      label: 'Screenshots',
                      count: stats.screenshotsCount,
                      onTap: () => context.go(
                        '${RouteNames.mediaFeed}?category=screenshots',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),

        // ─── FAVORITES ROW ───
        const FavoritesRow(),
      ],
    );
  }

  // ─── STORAGE SEGMENTS (thin multi-color bar) ───
  Widget _buildStorageSegments(DashboardStats stats, int totalBytes) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.xs),
      child: SizedBox(
        height: 6,
        child: Row(
          children: [
            _segment(stats.imagesCount, totalBytes, AppColors.primary),
            _segment(stats.videosCount, totalBytes, AppColors.secondary),
            _segment(stats.downloadsCount, totalBytes, AppColors.textMuted),
            _segment(stats.screenshotsCount, totalBytes, AppColors.textPrimary),
            // Remainder
            const Expanded(child: ColoredBox(color: AppColors.divider)),
          ],
        ),
      ),
    );
  }

  Widget _segment(int count, int totalBytes, Color color) {
    if (count == 0) return const SizedBox.shrink();
    return Expanded(
      flex: count.clamp(1, 1000),
      child: ColoredBox(color: color),
    );
  }

  // ─── LOADING ───
  Widget _buildLoading() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 80),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  // ─── ERROR ───
  Widget _buildError(String error) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: WoodCard(
        child: Text(
          'Could not load stats: $error',
          style: AppTypography.bodyMedium.copyWith(color: AppColors.danger),
        ),
      ),
    );
  }

  // ─── HELPERS ───
  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / 1024 / 1024).toStringAsFixed(1)} MB';
    }
    return '${(bytes / 1024 / 1024 / 1024).toStringAsFixed(1)} GB';
  }

  String _formatCount(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
      buf.write(s[i]);
    }
    return buf.toString();
  }
}

// ═══════════════════════════════════════════════════════════════
// Circle icon button (header)
// ═══════════════════════════════════════════════════════════════
class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, size: 20, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
