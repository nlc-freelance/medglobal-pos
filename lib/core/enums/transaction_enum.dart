enum TransactionType {
  refund('Refund'),
  sale('Sale');

  final String label;
  const TransactionType(this.label);
}

enum ReturnStatus {
  awaitingAction('Awaiting Action'),
  completed('Completed');

  final String label;
  const ReturnStatus(this.label);
}
