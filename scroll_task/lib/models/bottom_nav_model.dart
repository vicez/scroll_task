class BottomNavItem {
  BottomNavItem({
    required this.iconName,
    this.hasNotification = false,
    this.notificationCount,
  });

  final String iconName;
  final bool hasNotification;
  int? notificationCount;
}
