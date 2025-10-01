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
    validationText: 'Opening amount is required.',
  ),
  close(
    title: 'Close register shift',
    message: 'Open since',
    inputLabel: 'Closing Amount',
    validationText: 'Closing amount is required.',
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
