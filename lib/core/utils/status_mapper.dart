import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StatusMapper {
  StatusMapper._();

  /// Convert String [status] from DTO to enum
  static StockOrderStatus status(String? status) {
    switch (status) {
      case 'new':
        return StockOrderStatus.NEW;
      case 'for receiving':
        return StockOrderStatus.FOR_RECEIVING;
      case 'in progress':
        return StockOrderStatus.IN_PROGRESS;
      case 'shipped':
        return StockOrderStatus.SHIPPED;
      case 'completed':
        return StockOrderStatus.COMPLETED;
      case 'pending':
        return StockOrderStatus.PENDING;
      case 'cancelled':
        return StockOrderStatus.CANCELLED;
      default:
        throw Exception('Invalid status: $status');
    }
  }

  static Color color(StockOrderStatus status) {
    switch (status) {
      case StockOrderStatus.NEW:
        return UIColors.borderMuted;
      case StockOrderStatus.FOR_RECEIVING:
        return UIColors.forReceivingBg;
      case StockOrderStatus.IN_PROGRESS:
        return UIColors.inProgressBg;
      case StockOrderStatus.SHIPPED:
        return UIColors.shippedBg;
      case StockOrderStatus.COMPLETED:
        return UIColors.completedBg;
      case StockOrderStatus.PENDING:
        return UIColors.borderMuted;
      case StockOrderStatus.CANCELLED:
        return UIColors.cancelledBg;
    }
  }

  static Color textColor(StockOrderStatus status) {
    switch (status) {
      case StockOrderStatus.NEW:
        return UIColors.textLight;
      case StockOrderStatus.FOR_RECEIVING:
        return UIColors.forReceiving;
      case StockOrderStatus.IN_PROGRESS:
        return UIColors.inProgress;
      case StockOrderStatus.SHIPPED:
        return UIColors.shipped;
      case StockOrderStatus.COMPLETED:
        return UIColors.completed;
      case StockOrderStatus.PENDING:
        return UIColors.textLight;
      case StockOrderStatus.CANCELLED:
        return UIColors.cancelled;
    }
  }
}
