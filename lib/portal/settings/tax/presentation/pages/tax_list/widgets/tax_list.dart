import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_bloc/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/pages/tax_list/widgets/data_grid/tax_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/pages/tax_list/widgets/tax_header.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TaxList extends StatelessWidget with DialogMixin {
  const TaxList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaxBloc, TaxState>(
      listener: (context, state) => state.maybeWhen(
        processing: () => PageLoader.show(context),
        hasExistingDefault: (defaultTax) => _onSetTaxAsDefault(context, defaultTax),
        success: (message) => _onSaveSuccess(context, message),
        deleted: (message) => _onSuccess(context, message),
        failure: (message) => _onFailure(context, message),
        orElse: () => {},
      ),
      child: const Column(
        children: [
          TaxHeader(),
          Expanded(child: TaxDataGrid()),
        ],
      ),
    );
  }

  void _onSetTaxAsDefault(BuildContext context, Tax? defaultTax) {
    PageLoader.close();

    final taxFormCubit = context.read<TaxFormCubit>();
    final taxBloc = context.read<TaxBloc>();

    final tax = taxFormCubit.toTax();
    final event = taxFormCubit.state.id == null ? TaxEvent.createTaxCode(tax) : TaxEvent.updateTaxCode(tax);

    // When no default tax code is set
    if (defaultTax == null) {
      taxBloc.add(event);
      return;
    }

    // When tax on the form is the current default tax code, skip dialog
    if (tax.code == defaultTax.code) {
      taxBloc.add(event);
      return;
    } else {
      showConfirmDialog(
        context,
        title: 'Confirm Default Tax Code',
        content: TaxDefaultConfirm(tax.code),
        onConfirm: () => taxBloc.add(event),
      );
    }
  }

  void _onSuccess(BuildContext context, String message) {
    // Reload the list of tax codes
    context.read<PaginatedListBloc<Tax>>().add(const PaginatedListEvent.fetch());

    // Reload lazy list for tax dropdown
    context.read<LazyListBloc<Tax>>().add(const LazyListEvent<Tax>.refresh());

    ToastNotification.success(context, message);
    PageLoader.close();
  }

  void _onSaveSuccess(BuildContext context, String message) {
    _onSuccess(context, message);
    Navigator.of(context, rootNavigator: true).pop(); // Close dialog
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    ToastNotification.error(context, message);
  }
}

class TaxDefaultConfirm extends StatelessWidget {
  const TaxDefaultConfirm(this.taxCode, {super.key});

  final String taxCode;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: UIStyleText.bodyRegular.copyWith(fontSize: 13.5),
      TextSpan(
        text: 'A default tax code is already set. Do you still want to set',
        children: [
          TextSpan(
            text: ' "$taxCode" ',
            style: UIStyleText.bodyRegular.copyWith(fontSize: 13.5, fontWeight: FontWeight.w600),
          ),
          const TextSpan(text: 'as default?'),
          const TextSpan(text: '\n\nThis will replace the current default tax code.'),
        ],
      ),
    );
  }
}
