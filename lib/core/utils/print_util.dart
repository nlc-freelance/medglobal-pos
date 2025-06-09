import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/receipt_config.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:universal_html/html.dart' as html;

class PrintUtil {
  const PrintUtil();

  static Future<void> generateAndPrintReceipt({
    required Transaction transaction,
    required ReceiptConfig config,
  }) async {
    try {
      final doc = Document();

      final interRegular = Font.ttf(await rootBundle.load("assets/fonts/Inter-Regular.ttf"));
      final interMedium = Font.ttf(await rootBundle.load("assets/fonts/Inter-Medium.ttf"));
      final interSemiBold = Font.ttf(await rootBundle.load("assets/fonts/Inter-SemiBold.ttf"));

      final theme = ThemeData(
        header1: TextStyle(font: interSemiBold, fontSize: 14, fontWeight: FontWeight.normal),
        header2: TextStyle(font: interSemiBold, fontSize: 12, fontWeight: FontWeight.bold),
        header3: TextStyle(font: interSemiBold, fontSize: 10, fontWeight: FontWeight.bold),
        header4: TextStyle(font: interRegular, fontSize: 10.5, fontWeight: FontWeight.normal),
        tableHeader: TextStyle(font: interSemiBold, fontSize: 10, fontWeight: FontWeight.normal),
        tableCell: TextStyle(font: interRegular, fontSize: 11, fontWeight: FontWeight.normal),
        paragraphStyle: TextStyle(font: interRegular, fontSize: 9, fontWeight: FontWeight.normal),
      );

      doc.addPage(
        Page(
          orientation: PageOrientation.portrait,
          theme: theme,
          pageFormat: PdfPageFormat.roll80,
          build: (Context context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          (config.companyName ?? Strings.noValue).toUpperCase(),
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (config.showBranchName) ...[
                        SizedBox(height: 10),
                        Center(child: Text('${config.branchName}', style: theme.header2)),
                      ],
                      Center(
                        child: Text(
                          config.branchAddress ?? Strings.noValue,
                          style: theme.tableCell,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (config.showBranchContact) ...[
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Phone: ${config.branchPhone ?? Strings.noValue}',
                                style: theme.header4,
                              ),
                              if (config.branchEmail?.isNotEmpty == true)
                                Text(
                                  'Email: ${config.branchEmail ?? Strings.noValue}',
                                  style: theme.header4,
                                  textAlign: TextAlign.center,
                                )
                            ],
                          ),
                        ),
                      ],
                      SizedBox(height: 30),
                      Text(
                        'Receipt Date: ${DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now())}',
                        style: theme.header4,
                      ),
                      SizedBox(height: 1),
                      Text('Receipt ID: ${transaction.receiptId}', style: theme.header4),
                      SizedBox(height: 1),
                      Text('Cashier: ${transaction.employee.name}', style: theme.header4),
                      SizedBox(height: 1),
                      Text('Register: ${transaction.register.name}', style: theme.header4),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: 2, child: Text('Item', style: theme.tableHeader)),
                          SizedBox(width: 8),
                          Expanded(child: Text('Qty', style: theme.tableHeader)),
                          SizedBox(width: 8),
                          Expanded(child: Text('Price', style: theme.tableHeader)),
                          Expanded(child: Text('Total', style: theme.tableHeader, textAlign: TextAlign.end)),
                        ],
                      ),
                      SizedBox(height: 2),
                      Container(margin: const EdgeInsets.symmetric(vertical: 2), height: 0.9, color: PdfColors.black),
                      ...(transaction.items ?? []).map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.name!,
                                      style: TextStyle(font: interMedium, fontSize: 11, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              if (item.discountValue != null &&
                                  item.discountValue != 0 &&
                                  item.discountAmount != null) ...[
                                SizedBox(height: 2),
                                Text(
                                  '*Disc. ${item.discountType == DiscountType.percentage ? '${item.discountValue}%' : '₱${item.discountValue.toPesoString()}'}  (-${item.discountAmount.toPesoString()})',
                                  style: theme.tableCell,
                                ),
                              ],
                              SizedBox(height: 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(),
                                  Expanded(
                                    child: Text(
                                      item.quantity.toString(),
                                      style: theme.tableCell,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item.price.toPesoString(),
                                      style: theme.tableCell,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item.total.toPesoString(),
                                      style: theme.tableCell,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${(transaction.items ?? []).length.toString()} ITEMS',
                          style: theme.header3,
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SUBTOTAL', style: theme.header3),
                          Text(
                            transaction.subtotal.toPesoString(),
                            style: theme.header3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL DISCOUNT',
                            style: theme.header3,
                          ),
                          Text('-${transaction.totalDiscountAmount.toPesoString()}', style: theme.header3),
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('TOTAL', style: theme.header3),
                            Text(transaction.total.toPesoString(), style: theme.header3),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('CASH', style: theme.header3),
                          Text(transaction.amountPaid.toPesoString(), style: theme.header3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('CHANGE', style: theme.header3),
                          Text('${transaction.amountPaid! - transaction.total!}'.toPesoString(), style: theme.header3),
                        ],
                      ),
                      if (config.showFooterMessage) ...[
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            config.footerTitle ?? Strings.noValue,
                            style: theme.tableHeader,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (config.footerMessage?.isNotEmpty == true) ...[
                          SizedBox(height: 2),
                          Center(
                            child: Text(
                              config.footerMessage!,
                              textAlign: TextAlign.center,
                              style: theme.paragraphStyle.copyWith(lineSpacing: 0.6),
                            ),
                          ),
                        ],
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

      /// This is not working in Flutter Web build/release mode
      /// But is working fine in debug mode
      // await Printing.layoutPdf(
      //   onLayout: (PdfPageFormat format) async => doc.save(),
      // );

      // Convert PDF to Uint8List
      final pdfData = await doc.save();

      // Create a Blob from the Uint8List
      final blob = html.Blob([pdfData], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      Future.delayed(const Duration(milliseconds: 500), () {
        final script = html.ScriptElement()
          ..type = 'text/javascript'
          ..text = '''
                    (function() {
                      var printWindow = window.open('$url', '_blank');
                      // Trigger the print dialog
                      printWindow.onload = function() {
                        printWindow.focus(); // Ensure the new window is in focus
                        printWindow.print(); // Trigger the print dialog
                    }
                    })();
                  ''';
        html.document.body?.append(script);
      });

      // Clean up the URL object and iframe
      Future.delayed(const Duration(milliseconds: 500), () {
        html.Url.revokeObjectUrl(url); // Clean up URL
        html.document.querySelector('script')?.remove(); // Remove injected script
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<void> generateAndPrintOpenPO(PurchaseOrder order) async {
    try {
      final doc = Document();

      final interRegular = Font.ttf(await rootBundle.load("assets/fonts/Inter-Regular.ttf"));
      final interSemiBold = Font.ttf(await rootBundle.load("assets/fonts/Inter-SemiBold.ttf"));

      final theme = ThemeData(
        header1: TextStyle(font: interSemiBold, fontSize: 24, fontWeight: FontWeight.bold),
        header2: TextStyle(font: interSemiBold, fontSize: 16, fontWeight: FontWeight.bold),
        header3: TextStyle(font: interSemiBold, fontSize: 10, fontWeight: FontWeight.bold),
        header4: TextStyle(font: interRegular, fontSize: 10, fontWeight: FontWeight.normal),
        tableHeader: TextStyle(font: interSemiBold, fontSize: 8.5, fontWeight: FontWeight.bold),
        tableCell: TextStyle(font: interRegular, fontSize: 8, fontWeight: FontWeight.normal),
      );

      final List<List<String?>> tableData = order.items
              ?.map((item) => [
                    item.name,
                    (order.status == StockOrderStatus.FOR_RECEIVING ? item.quantityOrdered : item.quantityReceived)
                        .toString(),
                    item.supplierPrice.toPesoString(),
                    item.total.toPesoString(),
                  ])
              .toList() ??
          [];

      const int rowsPerPage = 20; // Number of rows per page
      final int totalPages = (tableData.length / rowsPerPage).ceil();

      // Add the first page with initial content
      doc.addPage(
        Page(
          margin: const EdgeInsets.all(30),
          build: (Context context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Purchase Order', style: theme.header1),
                SizedBox(height: 20),
                Text(order.supplier!.name, style: theme.header3),
                Text(order.supplier!.address, style: theme.header4),
                SizedBox(height: 20),
                Text('${order.branch!.name.toUpperCase()} BRANCH', style: theme.header3),
                Text(order.branch!.address, style: theme.header4),
                SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: GridView(
                    crossAxisCount: 3,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PO ID', style: theme.tableHeader),
                          Text(order.id.toString(), style: theme.header4),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PO Date', style: theme.tableHeader),
                          Text(DateFormat.yMd().format(order.createdAt!), style: theme.header4),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Estimated Date of Arrival', style: theme.tableHeader),
                          Text(
                            order.estimatedDateOfArrival != null
                                ? DateFormat.yMd().format(order.estimatedDateOfArrival!)
                                : Strings.noValue,
                            style: theme.header4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text('Purchase Order Items', style: theme.header3),
                Divider(color: PdfColors.grey),
                // Add the first chunk of the table data
                TableHelper.fromTextArray(
                  headers: ['Item Description', 'Qty', 'Unit Price', 'Total'],
                  data: tableData.take(rowsPerPage).toList(),
                  headerAlignment: Alignment.centerLeft,
                  cellAlignments: {
                    0: Alignment.centerLeft,
                    1: Alignment.centerRight,
                    2: Alignment.centerRight,
                    3: Alignment.centerRight,
                  },
                  border: null,
                  cellStyle: theme.tableCell,
                  headerStyle: theme.tableHeader,
                  headerDecoration: const BoxDecoration(color: PdfColors.grey200),
                  headerPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                ),
                if (tableData.length < 15) ...[
                  Divider(color: PdfColors.grey),
                  _buildSummary(order, theme),
                  SizedBox(height: 20),
                  Text('Delivery Details', style: theme.header3),
                  Divider(color: PdfColors.grey),
                  Text('${order.branch!.name.toUpperCase()} BRANCH', style: theme.header4),
                  Text(order.branch!.address, style: theme.header4),
                  SizedBox(height: 20),
                  Text('Notes', style: theme.header3),
                  Divider(color: PdfColors.grey),
                  if (order.notes?.isNotEmpty == true) Text(order.notes!, style: theme.header4),
                ],
              ],
            );
          },
        ),
      );

      if (totalPages == 1 && tableData.length > 15 && tableData.length <= 20) {
        doc.addPage(
          Page(
            margin: const EdgeInsets.all(30),
            build: (Context context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: PdfColors.grey),
                  _buildSummary(order, theme),
                  SizedBox(height: 30),
                  Text('Delivery Details', style: theme.header3),
                  Divider(color: PdfColors.grey),
                  Text('${order.branch!.name.toUpperCase()} BRANCH', style: theme.header4),
                  Text(order.branch!.address, style: theme.header4),
                  SizedBox(height: 30),
                  Text('Notes', style: theme.header3),
                  Divider(color: PdfColors.grey),
                  if (order.notes?.isNotEmpty == true) Text(order.notes!, style: theme.header4),
                ],
              );
            },
          ),
        );
      }

      // Add additional pages with the remaining table data
      for (int page = 1; page < totalPages; page++) {
        final start = page * rowsPerPage;
        final end = (start + rowsPerPage < tableData.length) ? start + rowsPerPage : tableData.length;
        doc.addPage(
          Page(
            margin: const EdgeInsets.all(30),
            build: (Context context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Purchase Order Items', style: theme.header3),
                  Divider(color: PdfColors.grey),
                  TableHelper.fromTextArray(
                    headers: ['Item Description', 'Qty', 'Unit Price', 'Total'],
                    data: tableData.sublist(start, end),
                    headerAlignment: Alignment.centerLeft,
                    cellAlignments: {
                      0: Alignment.centerLeft,
                      1: Alignment.centerRight,
                      2: Alignment.centerRight,
                      3: Alignment.centerRight,
                    },
                    border: null,
                    cellStyle: theme.tableCell,
                    headerStyle: theme.tableHeader,
                    headerDecoration: const BoxDecoration(color: PdfColors.grey200),
                    headerPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  ),
                  // If this is the last page, include summary and additional content
                  if (page == totalPages - 1) ...[
                    Divider(color: PdfColors.grey),
                    _buildSummary(order, theme),
                    SizedBox(height: 30),
                    Text('Delivery Details', style: theme.header3),
                    Divider(color: PdfColors.grey),
                    Text('${order.branch!.name.toUpperCase()} BRANCH', style: theme.header4),
                    Text(order.branch!.address, style: theme.header4),
                    SizedBox(height: 30),
                    Text('Notes', style: theme.header3),
                    Divider(color: PdfColors.grey),
                    if (order.notes?.isNotEmpty == true) Text(order.notes!, style: theme.header4),
                  ],
                ],
              );
            },
          ),
        );
      }

      // Convert PDF to Uint8List
      final pdfData = await doc.save();

      // Create a Blob from the Uint8List
      final blob = html.Blob([pdfData], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      Future.delayed(const Duration(milliseconds: 500), () {
        final script = html.ScriptElement()
          ..type = 'text/javascript'
          ..text = '''
                    (function() {
                      var printWindow = window.open('$url', '_blank');
                      // Trigger the print dialog
                      printWindow.onload = function() {
                        printWindow.focus(); // Ensure the new window is in focus
                        printWindow.print(); // Trigger the print dialog
                    }
                    })();
                  ''';
        html.document.body?.append(script);
      });

      // Clean up the URL object and iframe
      Future.delayed(const Duration(milliseconds: 500), () {
        html.Url.revokeObjectUrl(url); // Clean up URL
        html.document.querySelector('script')?.remove(); // Remove injected script
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  static Widget _buildSummary(PurchaseOrder order, ThemeData theme) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Spacer(flex: 8),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal', style: theme.tableHeader),
                    Text(order.itemSubtotal.toPesoString(), style: theme.tableCell),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount', style: theme.tableHeader),
                    Text(order.discount.toPesoString(), style: theme.tableCell),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax', style: theme.tableHeader),
                    Text(order.tax.toPesoString(), style: theme.tableCell),
                  ],
                ),
                Divider(color: PdfColors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: theme.header3),
                    Text(order.totalAmount.toPesoString(), style: theme.header3),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
