class MonthlyChatItem {
  final String id;
  final String monthName;
  final bool isCurrentMonth;
  final DateTime lastActivity;

  MonthlyChatItem({
    required this.id,
    required this.monthName,
    required this.isCurrentMonth,
    required this.lastActivity,
  });
}