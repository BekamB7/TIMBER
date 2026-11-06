import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/route_names.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../widgets/wood_card.dart';

/// Temporary screen used only to verify theme + routing in Module 1.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TIMBER', style: AppTypography.labelSmall),
              const SizedBox(height: AppSpacing.sm),
              Text(title, style: AppTypography.headlineLarge),
              const SizedBox(height: AppSpacing.xxxl),
              WoodCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Foundation ready',
                        style: AppTypography.titleLarge),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Theme, routing, and structure are wired up. '
                      'Each module replaces this placeholder with a real screen.',
                      style: AppTypography.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              Text('Navigate', style: AppTypography.titleMedium),
              const SizedBox(height: AppSpacing.md),
              _NavButton(
                label: 'Dashboard',
                onTap: () => context.go(RouteNames.dashboard),
              ),
              _NavButton(
                label: 'Media Feed (images)',
                onTap: () => context.go(
                  '${RouteNames.mediaFeed}?${RouteNames.categoryParam}=images',
                ),
              ),
              _NavButton(
                label: 'Viewer (sample)',
                onTap: () => context.go(
                  '${RouteNames.viewer}?${RouteNames.fileIdParam}=sample-123',
                ),
              ),
              _NavButton(
                label: 'Albums',
                onTap: () => context.go(RouteNames.albums),
              ),
              _NavButton(
                label: 'Trash',
                onTap: () => context.go(RouteNames.trash),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Material(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(label, style: AppTypography.bodyLarge),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.textMuted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
