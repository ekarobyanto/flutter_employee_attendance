import 'package:flutter/material.dart';
import 'package:user_attendance/enum/attendance_mode.dart';
import 'package:user_attendance/widgets/attendance_button.dart';

class AttendanceButtonBar extends StatelessWidget {
  const AttendanceButtonBar({
    super.key,
    required this.mode,
    required this.onModeChange,
  });

  final AttendanceMode mode;
  final Function(AttendanceMode) onModeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: AttendanceButton(
              label: "Add Point",
              isSelected: mode == AttendanceMode.addPoint,
              onPressed: () => onModeChange(AttendanceMode.addPoint),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AttendanceButton(
              label: "Attendance",
              isSelected: mode == AttendanceMode.absence,
              onPressed: () => onModeChange(AttendanceMode.absence),
            ),
          ),
        ],
      ),
    );
  }
}
