import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:universal_html/html.dart' as html;

class PrintUtil {
  const PrintUtil();

  static Future<void> generateAndPrintReceipt(Transaction transaction) async {
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
                          'MEDGLOBAL PHARMACY',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(child: Text('${transaction.branch?.name}', style: theme.header2)),
                      Center(child: Text(transaction.branchAddress, style: theme.tableCell)),
                      SizedBox(height: 30),
                      Text(
                        'Receipt Date: ${DateFormat('yyyy/MM/dd HH:mm:ss').format(DateTime.now())}',
                        style: theme.header4,
                      ),
                      SizedBox(height: 1),
                      Text('Receipt ID: ${transaction.receiptId}', style: theme.header4),
                      SizedBox(height: 1),
                      Text('Cashier: ${transaction.employee?.name}', style: theme.header4),
                      SizedBox(height: 1),
                      Text('Register: ${transaction.registerNo}', style: theme.header4),
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
                              if (item.discount != null && item.discount != 0 && item.discountInPeso != null) ...[
                                SizedBox(height: 2),
                                Text(
                                  '*Disc. ${item.discountType == DiscountType.PERCENT ? '${item.discount}%' : '₱${item.discount.toPesoString()}'}  (-${item.discountInPeso.toPesoString()})',
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
                                      item.qty.toString(),
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
                      if (transaction.discount != null &&
                          transaction.discount != 0 &&
                          transaction.discountInPeso != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DISCOUNT (${transaction.discountType == DiscountType.PERCENT ? '${transaction.discount}%' : Strings.empty})',
                              style: theme.header3,
                            ),
                            Text(transaction.discountInPeso.toPesoString(), style: theme.header3),
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
                      SizedBox(height: 30),
                      Center(
                        child: Text(
                          'Stay safe and take care!',
                          style: theme.tableHeader,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'We appreciate your feedback! Please feel free to text or call us at 09177094242.',
                        textAlign: TextAlign.center,
                        style: theme.paragraphStyle.copyWith(lineSpacing: 0.6),
                      ),
                    ],
                  ),
                ),
                Divider(),
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
}
