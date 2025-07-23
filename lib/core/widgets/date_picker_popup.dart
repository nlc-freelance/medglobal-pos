import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPopup extends StatefulWidget {
  const DatePickerPopup({
    super.key,
    this.selectedDate,
    this.selectedDateRange,
    this.isInput = false,
    required this.selectionMode,
    this.onSelect,
    this.onSelectRange,
    this.onRemoveSelected,
    this.showEndIcon = true,
  });

  final bool isInput;
  final bool showEndIcon;
  final DateTime? selectedDate;
  final List<DateTime?>? selectedDateRange;
  final void Function(DateTime)? onSelect;
  final void Function(List<DateTime?>)? onSelectRange;
  final DateRangePickerSelectionMode selectionMode;
  final VoidCallback? onRemoveSelected;

  @override
  State<DatePickerPopup> createState() => _DatePickerPopupState();
}

class _DatePickerPopupState extends State<DatePickerPopup> {
  DateTime? _selectedDate;
  List<DateTime?> _selectedDateRange = [];

  @override
  void initState() {
    super.initState();
    if (widget.selectedDate != null) _selectedDate = widget.selectedDate;
    if (widget.selectedDateRange != null) _selectedDateRange = widget.selectedDateRange!;
  }

  bool get highlight => !widget.isInput && (_selectedDate != null || _selectedDateRange.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
          backgroundColor: UIColors.background,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 320,
            width: widget.selectionMode == DateRangePickerSelectionMode.range ? 600 : 300,
            child: SfDateRangePicker(
              selectionShape: DateRangePickerSelectionShape.rectangle,
              headerStyle: const DateRangePickerHeaderStyle(
                backgroundColor: UIColors.background,
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 18,
                  color: UIColors.textRegular,
                ),
              ),
              initialSelectedDate: _selectedDate,
              initialSelectedRange: _selectedDateRange.isNotEmpty
                  ? PickerDateRange(_selectedDateRange.first, _selectedDateRange.last)
                  : null,
              view: DateRangePickerView.month,
              selectionMode: widget.selectionMode,
              enableMultiView: widget.selectionMode == DateRangePickerSelectionMode.range,
              navigationDirection: DateRangePickerNavigationDirection.horizontal,
              viewSpacing: 20,
              headerHeight: 60,
              allowViewNavigation: true,
              showActionButtons: true,
              backgroundColor: UIColors.background,
              selectionColor: UIColors.primary,
              showNavigationArrow: true,
              rangeSelectionColor: UIColors.secondary,
              endRangeSelectionColor: UIColors.primary,
              startRangeSelectionColor: UIColors.primary,
              todayHighlightColor: UIColors.primary,
              onSubmit: (value) {
                if (value is PickerDateRange) {
                  DateTime? rangeStartDate = value.startDate;
                  DateTime? rangeEndDate = value.endDate;
                  setState(() => _selectedDateRange = [rangeStartDate, rangeEndDate ?? rangeStartDate]
                    ..removeWhere((date) => date == null));
                  if (widget.onSelectRange != null) widget.onSelectRange!(_selectedDateRange);
                } else if (value is DateTime) {
                  DateTime selectedDate = value;
                  setState(() => _selectedDate = selectedDate);
                  if (widget.onSelect != null) widget.onSelect!(selectedDate);
                }

                Navigator.pop(context);
              },
              onCancel: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      child: HoverBuilder(
        builder: (isHover) => Container(
          constraints: const BoxConstraints(minWidth: 150),
          padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: highlight
                ? UIColors.secondary
                : isHover
                    ? UIColors.whiteBg
                    : UIColors.background,
            border: Border.all(color: highlight ? UIColors.primary.withOpacity(0.2) : UIColors.borderRegular),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              _selectedDate != null || _selectedDateRange.isNotEmpty
                  ? Text(
                      widget.selectionMode == DateRangePickerSelectionMode.range
                          ? _selectedDateRange
                              .map((value) => value != null ? DateFormat('MMMM dd, yyyy').format(value) : '')
                              .join(' - ')
                          : DateFormat('MMMM dd, yyyy').format(_selectedDate!),
                      style:
                          UIStyleText.labelMedium.copyWith(color: highlight ? UIColors.primary : UIColors.textRegular),
                    )
                  : Text(
                      widget.isInput ? 'Select date' : 'All Time',
                      style: UIStyleText.hint.copyWith(
                        color: widget.isInput ? UIColors.textMuted : UIColors.textRegular,
                        fontWeight: widget.isInput ? FontWeight.w400 : FontWeight.w500,
                      ),
                    ),
              const UIHorizontalSpace(10),
              if (widget.showEndIcon)
                (_selectedDate != null || _selectedDateRange.isNotEmpty) && widget.onRemoveSelected != null
                    ? SizedBox(
                        height: 18,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            setState(() => widget.selectionMode == DateRangePickerSelectionMode.single
                                ? _selectedDate = null
                                : _selectedDateRange = []);
                            widget.onRemoveSelected!();
                          },
                          child: Assets.icons.close.svg(height: 22),
                        ),
                      )
                    : Assets.icons.arrowDown.svg(),
            ],
          ),
        ),
      ),
    );
  }
}
