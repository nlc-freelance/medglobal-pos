import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as widgets;
import 'package:printing/printing.dart';

class PrintUtil {
  const PrintUtil();

  static Future<void> printPdf() async {
    try {
      final doc = widgets.Document();

      doc.addPage(widgets.Page(
          pageFormat: PdfPageFormat.roll57,
          build: (widgets.Context context) {
            return widgets.Center(
              child: widgets.Text('Receipt'),
            );
          }));

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save(),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
