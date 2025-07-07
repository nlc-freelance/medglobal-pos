enum SupplyNeedsAction {
  NEW_PURCHASE_ORDER('New Purchase Order'),
  NEW_STOCK_TRANSFER('New Stock Transfer'),
  DOWNLOAD_CSV('Download CSV');

  final String label;
  const SupplyNeedsAction(this.label);
}

enum StockOrderStatus {
  NEW('New'),
  FOR_RECEIVING('For Receiving'),
  IN_PROGRESS('In Progress'),
  SHIPPED('Shipped'),
  COMPLETED('Completed'),
  PENDING('Pending'),
  CANCELLED('Cancelled');

  final String label;
  const StockOrderStatus(this.label);
}

enum StockOrderUpdate {
  SAVE,
  SAVE_AND_MARK_AS_SHIPPED,
  SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS,
  SAVE_AND_RECEIVED,
  MARK_AS_COMPLETE,
  CANCEL,
}

enum StockTakeItemAction {
  DO_NOTHING('Do nothing'),
  SET_QTY_TO_ZERO('Set quantity to 0');

  final String label;
  const StockTakeItemAction(this.label);
}
