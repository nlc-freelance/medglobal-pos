import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPopup extends StatefulWidget {
  const DatePickerPopup({
    super.key,
    this.selectedDate,
    required this.onSelect,
  });

  final DateTime? selectedDate;
  final void Function(DateTime value) onSelect;

  @override
  State<DatePickerPopup> createState() => _DatePickerPopupState();
}

class _DatePickerPopupState extends State<DatePickerPopup> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.selectedDate != null) _selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      tooltip: Strings.empty,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          enabled: false,
          child: SizedBox(
            width: 500,
            height: 350,
            child: SfDateRangePicker(
              initialDisplayDate: _selectedDate,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.single,
              todayHighlightColor: UIColors.primary,
              headerHeight: 60,
              headerStyle: const DateRangePickerHeaderStyle(backgroundColor: UIColors.background),
              enablePastDates: false,
              allowViewNavigation: false,
              backgroundColor: UIColors.background,
              selectionColor: UIColors.primary,
              showNavigationArrow: true,
              onSelectionChanged: (args) {
                setState(() => _selectedDate = args.value);
                widget.onSelect(args.value);
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
      child: HoverBuilder(
        builder: (isHover) => Container(
          // height: 38,
          padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: UIColors.background,
            border: Border.all(color: isHover ? UIColors.buttonPrimaryHover : UIColors.borderRegular),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.calendar.setColorOnHover(isHover),
              const UIHorizontalSpace(10),
              UIText.labelMedium(
                _selectedDate != null ? DateFormat.yMd().format(_selectedDate!) : 'Date',
                color: isHover ? UIColors.primary : UIColors.textRegular,
              ),
              const Spacer(),
              Assets.icons.arrowDown.setColorOnHover(isHover)
            ],
          ),
        ),
      ),
    );
  }
}
