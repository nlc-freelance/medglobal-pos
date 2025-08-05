enum RegisterShiftStatus {
  open(label: 'Open'),
  closed(label: 'Closed');

  final String label;

  const RegisterShiftStatus({required this.label});
}

enum RegisterShiftAction {
  open(
    title: 'Open Register Shift',
    message: 'Closed since',
    inputLabel: 'Opening Amount',
    validationText: 'Please enter the opening register cash.',
  ),
  close(
    title: 'Close register shift',
    message: 'Open since',
    inputLabel: 'Closing Amount',
    validationText: 'Please enter the closing register cash.',
  );

  final String title;
  final String message;
  final String inputLabel;
  final String validationText;

  const RegisterShiftAction({
    required this.title,
    required this.message,
    required this.inputLabel,
    required this.validationText,
  });
}
