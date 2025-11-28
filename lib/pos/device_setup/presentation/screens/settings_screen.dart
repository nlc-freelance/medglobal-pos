import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/printer/printer_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:printing/printing.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  String? printer;
  List<Printer> printers = [];

  @override
  void initState() {
    super.initState();
    context.read<PrinterCubit>().findPrinters();
    setState(() {
      printer = GetIt.I<AppSessionService>().printer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: AppCustomDialog(
        maxWidth: 600,
        title: 'Settings',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Printer', style: UIStyleText.heading6.copyWith(fontSize: 15)),
                      Text(
                        'Select a printer to use as the default for receipt printing.',
                        style: UIStyleText.hintRegular,
                      ),
                    ],
                  ),
                ),
                const UIHorizontalSpace(16),
                BlocConsumer<PrinterCubit, PrinterState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      loaded: (data) => setState(() => printers = data),
                      printerSavedLocally: () {
                        setState(() {
                          printer = GetIt.I<AppSessionService>().printer;
                        });
                      },
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      failure: (message) => UIText.labelMedium(message, color: UIColors.error),
                      orElse: () => AppDropdown<Printer>.static(
                        items: printers,
                        getName: (printer) => printer.url,
                        onSelectItem: (printer) => context.read<PrinterCubit>().savePrinterSetting(printer),
                        hint: 'Select printer',
                        value: printer == null ? null : Printer(url: printer!),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        actions: const SizedBox(),
      ),
    );
  }
}
