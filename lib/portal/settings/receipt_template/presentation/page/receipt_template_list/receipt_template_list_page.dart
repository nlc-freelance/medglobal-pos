import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_list/widgets/receipt_template_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_list/widgets/receipt_template_header.dart';

class ReceiptTemplateListPage extends StatefulWidget {
  const ReceiptTemplateListPage({super.key});

  @override
  State<ReceiptTemplateListPage> createState() => _ReceiptTemplateListPageState();
}

class _ReceiptTemplateListPageState extends State<ReceiptTemplateListPage> {
  late PaginatedListBloc<ReceiptTemplate> _receiptTemplateListBloc;

  @override
  initState() {
    super.initState();
    _receiptTemplateListBloc = context.read<PaginatedListBloc<ReceiptTemplate>>();
    _receiptTemplateListBloc.add(const PaginatedListEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ReceiptTemplateHeader(),
        Expanded(child: ReceiptTemplateDataGrid()),
      ],
    );
  }

  @override
  dispose() {
    _receiptTemplateListBloc.add(const PaginatedListEvent.reset());
    super.dispose();
  }
}
