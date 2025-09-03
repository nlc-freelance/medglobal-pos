import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum TransactionType {
  refund('Refund'),
  sale('Sale');

  final String label;

  Color get bgColor => this == sale ? UIColors.completedBg : UIColors.cancelledBg;
  Color get textColor => this == sale ? UIColors.completed : UIColors.cancelled;

  const TransactionType(this.label);
}

enum ReturnStatus {
  awaitingAction('Awaiting Action'),
  completed('Completed');
  awaitingAction('Awaiting Action'),
  completed('Completed');

  final String label;
  const ReturnStatus(this.label);
}
