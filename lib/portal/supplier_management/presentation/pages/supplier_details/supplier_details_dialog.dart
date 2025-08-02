import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_details/supplier_form_view.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

// class SupplierFormDialog extends DialogHandler {
//   SupplierFormDialog([this.supplier]);

//   final Supplier? supplier;

//   @override
//   Widget create(BuildContext context) => SupplierFormView(context, supplier: supplier);
// }

class SupplierFormDialog extends StatelessWidget {
  const SupplierFormDialog({super.key, this.supplier});

  final Supplier? supplier;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          margin: const EdgeInsets.all(16),
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            color: UIColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Assets.icons.arrowRight1.svg(colorFilter: UIColors.textRegular.toColorFilter),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                  child: SupplierFormView(context, supplier: supplier),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
