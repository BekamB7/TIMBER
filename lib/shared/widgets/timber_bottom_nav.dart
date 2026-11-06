import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/route_names.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// ═══════════════════════════════════════════════════════════════
/// Floating bottom nav bar — 4 tabs, wood surface, active tab glows oak.
/// Used on Dashboard, Browse, Albums, Trash screens.
/// ═══════════════════════════════════════════════════════════════
class TimberBottomNav extends StatelessWidget {
  const TimberBottomNav({super.key});

  static const _items = [
    _NavItem(
      route: RouteNames.dashboard,
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
    ),
    _NavItem(
      route: RouteNames.mediaFeed,
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view_rounded,
      label: 'Browse',
    ),
    _NavItem(
      route: RouteNames.albums,
      icon: Icons.photo_album_outlined,
      activeIcon: Icons.photo_album_rounded,
      label: 'Albums',
    ),
    _NavItem(
      route: RouteNames.trash,
      icon: Icons.delete_outline,
      activeIcon: Icons.delete_rounded,
      label: 'Trash',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xl,
          0,
          AppSpacing.xl,
          AppSpacing.md,
        ),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: AppColors.elevated,
            borderRadius: BorderRadius.circular(AppRadius.xxl),
            border: Border.all(
              color: AppColors.divider.withValues(alpha: 0.5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _items.map((item) {
              final isActive = _isActive(currentRoute, item.route);
              return _NavButton(
                item: item,
                isActive: isActive,
                onTap: () {
                  if (!isActive) {
                    context.go(item.route);
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  bool _isActive(String currentRoute, String targetRoute) {
    if (targetRoute == RouteNames.dashboard) {
      return currentRoute == RouteNames.dashboard || currentRoute.isEmpty;
    }
    if (targetRoute == RouteNames.mediaFeed) {
      return currentRoute.startsWith(RouteNames.mediaFeed);
    }
    return currentRoute == targetRoute;
  }
}

// ═══════════════════════════════════════════════════════════════
// Data for a nav item
// ═══════════════════════════════════════════════════════════════
class _NavItem {
  const _NavItem({
    required this.route,
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final String route;
  final IconData icon;
  final IconData activeIcon;
  final String label;
}

// ═══════════════════════════════════════════════════════════════
// Individual nav button
// ═══════════════════════════════════════════════════════════════
class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with glow when active
            Stack(
              alignment: Alignment.center,
              children: [
                if (isActive)
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withValues(alpha: 0.15),
                    ),
                  ),
                Icon(
                  isActive ? item.activeIcon : item.icon,
                  size: 22,
                  color: isActive ? AppColors.primary : AppColors.textMuted,
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              item.label,
              style: AppTypography.labelSmall.copyWith(
                color: isActive ? AppColors.primary : AppColors.textMuted,
                fontSize: 10,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
