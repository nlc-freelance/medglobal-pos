enum TransactionType {
  REFUND('Refund'),
  SALE('Sale');

  final String label;
  const TransactionType(this.label);
}

enum ReturnStatus {
  AWAITING_ACTION('Awaiting Action'),
  COMPLETED('Completed');

  final String label;
  const ReturnStatus(this.label);
}
