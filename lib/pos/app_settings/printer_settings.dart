// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/constants/strings.dart';
// import 'package:medglobal_admin_portal/pos/app_settings/printer_cubit.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
// import 'package:printing/printing.dart';
//
// class PrinterSettings extends StatelessWidget {
//   const PrinterSettings({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
//       backgroundColor: UIColors.background,
//       child: Container(
//         constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
//         padding: const EdgeInsets.symmetric(vertical: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             UIText.heading5('Set Up Receipt Printer'),
//             Text(
//               'Please select a printer that will be used for receipt printing on this device. You can change this later in the app settings.',
//               style: UIStyleText.hint,
//             ),
//             const UIVerticalSpace(8),
//             const Divider(color: UIColors.borderMuted),
//             const UIVerticalSpace(10),
//             BlocBuilder<PrinterCubit, PrinterState>(
//               builder: (context, state) {
//                 return state.maybeWhen(
//                   loading: () => const CupertinoActivityIndicator(),
//                   loaded: (printers) => PrinterListView(printers),
//                   failure: (message) => UIText.bodyRegular(message),
//                   orElse: () => const SizedBox(),
//                 );
//               },
//             ),
//             UIButton.filled(
//               'Select printer',
//               onClick: () {},
//             ),
//
//             ///
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PrinterListView extends StatefulWidget {
//   const PrinterListView(this.printers, {super.key});
//
//   final List<Printer> printers;
//
//   @override
//   State<PrinterListView> createState() => _PrinterListViewState();
// }
//
// class _PrinterListViewState extends State<PrinterListView> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: widget.printers
//           .map((printer) => InkWell(
//                 child: UIText.bodyRegular(printer.name),
//                 onTap: () => context.read<PrinterCubit>().savePrinterSetting(printer.name),
//               ))
//           .toList(),
//     );
//   }
// }
