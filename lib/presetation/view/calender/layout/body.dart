import 'package:flutter/cupertino.dart';
import 'package:front_end_task/elements/constants/app_theme.dart';
import 'package:front_end_task/elements/widgets/text/text_widget.dart';

import '../../../../elements/constants/constants.dart';
import '../../../../elements/widgets/buttons/icon_button.dart';
import '../../../../elements/widgets/stack_card.dart';
import 'components/upcoming.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({super.key});

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kWhiteBg,
        border: Border(
          left: BorderSide(
            color: AppColors.kGray,
            width: 1.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text30(
                text: 'Calendar',
                style: AppTypography.kAppStyle(fontSize: 28),
              ),
              22.verticalSpace,
              _buildCalendarToggle(),
              24.verticalSpace,
              _buildCalendar(),
              const SizedBox(height: 24),
              const UpcomingSection()
            ],
          ),
        ),
      ),
    );
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void _setCalendarFormat(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  Widget _buildCalendarToggle() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.kLightGray,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildToggleButton('Month', CalendarFormat.month),
              _buildToggleButton('Week', CalendarFormat.twoWeeks),
              _buildToggleButton('Day', CalendarFormat.week),
            ],
          ),
        ),
        const Spacer(),
        CustomIconButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),  // Custom color
        ),
      ],
    );
  }

  Widget _buildToggleButton(String text, CalendarFormat format) {
    final bool isSelected = _calendarFormat == format;
    return GestureDetector(
      onTap: () => _setCalendarFormat(format),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.grey[300]!, blurRadius: 4)]
              : null,
        ),
        child: Text15(
          text: text,
          style:
              AppTypography.kAppStyle().copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return CustomStackCard(
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        calendarFormat: _calendarFormat,
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: AppTypography.kAppStyle(fontSize: 18),
          leftChevronIcon: const Icon(CupertinoIcons.arrow_left, size: 22),
          rightChevronIcon: const Icon(CupertinoIcons.arrow_right, size: 22),
        ),
        calendarStyle: CalendarStyle(
          canMarkersOverflow: false,
          defaultDecoration: BoxDecoration(
            color: AppColors.kGray2.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
                12),
          ),
          disabledDecoration: BoxDecoration(
            color: AppColors.kGray2.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
                12),
          ),
          todayDecoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(
                12),
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(
                12),
          ),
        ),
      ),
    );
  }
}
