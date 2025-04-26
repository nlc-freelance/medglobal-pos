enum RegisterShiftStatus {
  open(label: 'Open'),
  close(label: 'Closed');

  final String label;

  const RegisterShiftStatus({required this.label});
}

enum RegisterShiftAction {
  open(
    title: 'Open Register Shift',
    message: 'Closed since',
    input: 'Opening Amount',
    validation: 'Please enter the opening register cash.',
  ),
  close(
    title: 'Close register shift',
    message: 'Open since',
    input: 'Closing Amount',
    validation: 'Please enter the closing register cash.',
  );

  final String title;
  final String message;
  final String input;
  final String validation;

  const RegisterShiftAction({
    required this.title,
    required this.message,
    required this.input,
    required this.validation,
  });
}
