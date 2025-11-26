import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _NavLink extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavLink({
    required this.label,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: isActive
              ? Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                )
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurfaceVariant,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class AppNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;

  const AppNavBar({
    super.key,
    required this.currentRoute,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSupport = currentRoute == '/support';
    final isPrivacy = currentRoute == '/privacy';

    return AppBar(
      automaticallyImplyLeading: false,
      title: currentRoute == '/'
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/app-icon.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                Text(
                  'Batch File Rename Assistant',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          : InkWell(
              onTap: () {
                Get.offAllNamed('/');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/app-icon.png',
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Batch File Rename Assistant',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
      actions: [
        _NavLink(
          label: 'Support',
          isActive: isSupport,
          onTap: isSupport
              ? null
              : () {
                  Get.toNamed('/support');
                },
        ),
        const SizedBox(width: 8),
        _NavLink(
          label: 'Privacy Policy',
          isActive: isPrivacy,
          onTap: isPrivacy
              ? null
              : () {
                  Get.toNamed('/privacy');
                },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

