import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as widgets;
import 'package:printing/printing.dart';

class PrintUtil {
  const PrintUtil();

  static Future<void> printPdf(Transaction transaction) async {
    try {
      final doc = widgets.Document();

      doc.addPage(
        widgets.Page(
          pageFormat: PdfPageFormat.roll80,
          build: (widgets.Context context) {
            return widgets.Column(
              children: [
                widgets.Text('Receipt', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text(transaction.receiptId!, style: widgets.TextStyle(fontSize: 36)),
                widgets.Divider(),
                widgets.SizedBox(height: 60),
                widgets.Text('', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ABSOLUTE DISTILLED WATER', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ABSOLUTE DISTILLED WATER', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ABSOLUTE DISTILLED WATER', style: widgets.TextStyle(fontSize: 36)),
                widgets.SizedBox(height: 60),
                widgets.Divider(),
                widgets.SizedBox(height: 60),
                widgets.Text('ADVIL LIQUIGEL 200mg', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ADVIL LIQUIGEL 200mg', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ADVIL LIQUIGEL 200mg', style: widgets.TextStyle(fontSize: 36)),
                widgets.SizedBox(height: 30),
                widgets.Text('ADVIL LIQUIGEL 200mg', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ADVIL LIQUIGEL 200mg', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ABSOLUTE DISTILLED WATER', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ABSOLUTE DISTILLED WATER', style: widgets.TextStyle(fontSize: 36)),
                widgets.Divider(),
                widgets.SizedBox(height: 60),
                widgets.SizedBox(height: 30),
                widgets.Text('ADVIL LIQUIGEL 200mg', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ADVIL LIQUIGEL 200mg', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ABSOLUTE DISTILLED WATER', style: widgets.TextStyle(fontSize: 36)),
                widgets.Text('ABSOLUTE DISTILLED WATER', style: widgets.TextStyle(fontSize: 36)),
              ],
            );
          },
        ),
      );

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
