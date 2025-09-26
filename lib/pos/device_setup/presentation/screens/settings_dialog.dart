// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_portal/flutter_portal.dart';
// import 'package:get_it/get_it.dart';
// import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
// import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
// import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
// import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/printer/printer_cubit.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
// import 'package:printing/printing.dart';
//
// class SettingsDialog extends StatelessWidget {
//   const SettingsDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Portal(
//       child: AppCustomDialog(
//         maxWidth: 600,
//         title: 'Settings',
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       UIText.heading6('Printer'),
//                       Text(
//                         'Select printer to used as default for receipt printing.',
//                         style: UIStyleText.hintRegular,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const UIHorizontalSpace(16),
//                 BlocBuilder<PrinterCubit, PrinterState>(
//                   builder: (context, state) {
//                     return state.maybeWhen(
//                       loading: () => const CupertinoActivityIndicator(),
//                       loaded: (printers) => AppDropdown<Printer>.static(
//                         items: printers,
//                         getName: (printer) => printer.name,
//                         onSelectItem: (printer) => context.read<PrinterCubit>().savePrinterSetting(printer),
//                         onRemoveSelectedItem: () {},
//                         hint: 'Select printer',
//                         value: Printer(url: GetIt.I<AppSessionService>().printer ?? ''),
//                       ),
//                       failure: (message) => UIText.bodyRegular(message),
//                       orElse: () => const SizedBox(),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: const SizedBox(),
//       ),
//     );
//   }
// }
