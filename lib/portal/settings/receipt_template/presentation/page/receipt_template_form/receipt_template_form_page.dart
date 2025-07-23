import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/bloc/receipt_template_bloc/receipt_template_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/cubit/receipt_template_form_cubit/receipt_template_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_form/widgets/receipt_template_form_view.dart';

class ReceiptTemplateFormPage extends StatelessWidget {
  const ReceiptTemplateFormPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ReceiptTemplateFormCubit()),
        BlocProvider(create: (_) => ReceiptTemplateBloc(GetIt.I<ReceiptTemplateRepository>())),
      ],
      child: ReceiptTemplateForm(id: id),
    );
  }
}

class ReceiptTemplateForm extends StatefulWidget {
  const ReceiptTemplateForm({super.key, this.id});

  final String? id;

  @override
  State<ReceiptTemplateForm> createState() => _ReceiptTemplateFormState();
}

class _ReceiptTemplateFormState extends State<ReceiptTemplateForm> with DialogMixin {
  late final ReceiptTemplateFormCubit _receiptTemplateFormCubit;

  @override
  void initState() {
    super.initState();
    _receiptTemplateFormCubit = context.read<ReceiptTemplateFormCubit>();

    if (_isEditMode) {
      final receiptTemplateId = int.parse(widget.id!);
      context.read<ReceiptTemplateBloc>().add(ReceiptTemplateEvent.getReceiptTemplateById(receiptTemplateId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReceiptTemplateBloc, ReceiptTemplateState>(
      listener: (_, state) => state.maybeWhen(
        loaded: (template) => _receiptTemplateFormCubit.loadReceiptTemplate(template),
        processing: () => PageLoader.show(context),
        success: (message) => _onSuccess(context, message),
        failure: (message) => _onFailure(context, message),
        orElse: () => {},
      ),
      builder: (context, state) => state.maybeWhen(
        initial: () => _isEditMode ? const LoadingView() : const ReceiptTemplateFormView(),
        loading: () => const LoadingView(),
        loadFailed: (message) => FailureView(message),
        orElse: () => ReceiptTemplateFormView(isEditMode: _isEditMode),
      ),
    );
  }

  bool get _isEditMode => widget.id != null;

  void _onSuccess(BuildContext context, String message) {
    // Reload the list of receipt templates
    context.read<PaginatedListBloc<ReceiptTemplate>>().add(const PaginatedListEvent.fetch());

    // Reload lazy list for receipt template dropdown
    context.read<LazyListBloc<ReceiptTemplate>>().add(const LazyListEvent<ReceiptTemplate>.fetch(forceRefresh: true));

    SnackbarUtil.success(context, message);
    PageLoader.close();

    context.goNamed(SideMenuTreeItem.receiptTemplate.name);
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
