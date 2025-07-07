import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';

class DateUtil {
  const DateUtil._();

  static List<String> getMonths() {
    return List.generate(12, (index) {
      final date = DateTime(0, index + 1);
      return DateFormat.MMMM().format(date); // e.g., January, February, ...
    });
  }

  static List<int> getYears({int start = 2000, int? end}) {
    end ??= DateTime.now().year;
    final years = List.generate(end - start + 1, (index) => start + index);
    years.sort((a, b) => b.compareTo(a)); // Sort from recent to oldest
    return years;
  }

  static int getMonthNumber(String monthName) {
    try {
      // Use a fixed day and year for parsing
      DateTime date = DateFormat('MMMM').parse(monthName);
      return date.month; // Returns the month number (1-12)
    } catch (e) {
      return -1; // or handle error as needed
    }
  }

  static DateTime getMonthStartDate(int year, int month) => DateTime(year, month, 1);

  static DateTime getMonthEndDate(int year, int month) => month < 12
      ? DateTime(year, month + 1, 1).subtract(const Duration(days: 1))
      : DateTime(year + 1, 1, 1).subtract(const Duration(days: 1));

  static DateTime getStartDateByQuarter(int year, Quarter quarter) {
    switch (quarter) {
      case Quarter.q1:
        return getMonthStartDate(year, 1);
      case Quarter.q2:
        return getMonthStartDate(year, 4);
      case Quarter.q3:
        return getMonthStartDate(year, 7);
      case Quarter.q4:
        return getMonthStartDate(year, 10);
    }
  }

  static DateTime getEndDateByQuarter(int year, Quarter quarter) {
    switch (quarter) {
      case Quarter.q1:
        return getMonthEndDate(year, 3);
      case Quarter.q2:
        return getMonthEndDate(year, 6);
      case Quarter.q3:
        return getMonthEndDate(year, 9);
      case Quarter.q4:
        return getMonthEndDate(year, 12);
    }
  }

  static DateTime getStartDateByHalfYear(int year, HalfYear half) {
    switch (half) {
      case HalfYear.first:
        return getMonthStartDate(year, 1);
      case HalfYear.second:
        return getMonthStartDate(year, 7);
    }
  }

  static DateTime getEndDateByHalfYear(int year, HalfYear half) {
    switch (half) {
      case HalfYear.first:
        return getMonthEndDate(year, 6);
      case HalfYear.second:
        return getMonthEndDate(year, 12);
    }
  }

  static DateTime getYearStartDate(int year) => DateTime(year, 12, 1);

  static DateTime getYearEndDate(int year) => DateTime(year, 12, 31);
}
