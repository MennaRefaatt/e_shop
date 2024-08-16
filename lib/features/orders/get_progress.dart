import 'dart:ui';
import '../../core/styles/colors.dart';
class GetProgress {
  double getProgressValue(String? status) {
    switch (status) {
      case "Cancelled" || "ملغي":
        return 0.0;
      case "delivered":
        return 1.0;
      case "New"||"جديد":
        return 0.5;
      default:
        return 0.0; // Default value if status doesn't match any case
    }
  }

  Color getProgressColor(String status) {
    switch (status) {
      case "Cancelled"||"ملغي":
        return AppColors.greyBorder.withOpacity(0.1);
      case "delivered":
        return AppColors.primary;
      case "New"||"جديد":
        return AppColors.primary;
      default:
        return AppColors.greyBorder.withOpacity(0.1);
    // Default color if status doesn't match any case
    }
  }
}
