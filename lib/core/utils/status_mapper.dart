import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StatusMapper {
  StatusMapper._();

  /// Convert String [status] from DTO to enum
  static StockActionStatus status(String? status) {
    switch (status) {
      case 'new':
        return StockActionStatus.NEW;
      case 'for receiving':
        return StockActionStatus.FOR_RECEIVING;
      case 'in progress':
        return StockActionStatus.IN_PROGRESS;
      case 'shipped':
        return StockActionStatus.SHIPPED;
      case 'completed':
        return StockActionStatus.COMPLETED;
      case 'cancelled':
        return StockActionStatus.CANCELLED;
      default:
        throw Exception('Invalid status: $status');
    }
  }

  static Color color(StockActionStatus status) {
    switch (status) {
      case StockActionStatus.NEW:
        return UIColors.borderMuted;
      case StockActionStatus.FOR_RECEIVING:
        return UIColors.forReceivingBg;
      case StockActionStatus.IN_PROGRESS:
        return UIColors.inProgressBg;
      case StockActionStatus.SHIPPED:
        return UIColors.shippedBg;
      case StockActionStatus.COMPLETED:
        return UIColors.completedBg;
      case StockActionStatus.CANCELLED:
        return UIColors.cancelledBg;
      default:
        throw Exception('Invalid status: $status');
    }
  }

  static Color textColor(StockActionStatus status) {
    switch (status) {
      case StockActionStatus.NEW:
        return UIColors.textLight;
      case StockActionStatus.FOR_RECEIVING:
        return UIColors.forReceiving;
      case StockActionStatus.IN_PROGRESS:
        return UIColors.inProgress;
      case StockActionStatus.SHIPPED:
        return UIColors.shipped;
      case StockActionStatus.COMPLETED:
        return UIColors.completed;
      case StockActionStatus.CANCELLED:
        return UIColors.cancelled;
      default:
        throw Exception('Invalid status: $status');
    }
  }
}
