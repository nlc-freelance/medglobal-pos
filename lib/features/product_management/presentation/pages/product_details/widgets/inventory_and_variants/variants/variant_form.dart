import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory_and_variants/inventory_per_branch/inventory_per_branch.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory_and_variants/stock_keeping_unit/stock_keeping_unit_details.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:uuid/uuid.dart';

class VariantForm extends StatefulWidget {
  const VariantForm({
    super.key,
    required this.skuController,
    required this.nameController,
    required this.warningStockController,
    required this.idealStockController,
    required this.costController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController skuController;
  final TextEditingController warningStockController;
  final TextEditingController idealStockController;
  final TextEditingController costController;
  final GlobalKey<FormState> formKey;

  @override
  State<VariantForm> createState() => _VariantFormState();
}

class _VariantFormState extends State<VariantForm> {
  late VariantFormCubit _variantFormCubit;

  @override
  void initState() {
    super.initState();
    _variantFormCubit = BlocProvider.of<VariantFormCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VariantFormCubit, VariantFormState, Variant?>(
      selector: (state) => state.variant,
      builder: (context, variant) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageSectionTitle.subsection(
              title: 'Variations',
              subtitle: Strings.subtitlePlaceholder,
              action: UIButton.text(
                'Close',
                iconBuilder: (isHover) => Assets.icons.minusSquare.setColorOnHover(isHover),
                onClick: () {
                  context.read<VariantFormUiCubit>().hideVariantFormUi();

                  /// If variant name is default, meaning the product has no variant initially
                  /// Therefore if user decides to try and add a variant and change his mind,
                  /// the values will still exist outside the variant form
                  if (variant?.name != 'default') _variantFormCubit.resetForm();
                },
              ),
            ),
            DottedBorder(
              color: UIColors.textRegular.withOpacity(0.3),
              radius: const Radius.circular(12),
              dashPattern: const [10],
              borderType: BorderType.RRect,
              borderPadding: const EdgeInsets.all(2),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: UITextFormField.topLabel(
                            label: 'Variant Name',
                            hint: 'Enter variant name',
                            controller: widget.nameController,
                            showRequired: true,
                            validator: (value) {
                              if (value?.isEmpty == true || value == 'default') return 'Please enter a variant name.';
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const UIVerticalSpace(40),
                    StockKeepingUnitDetails(
                      skuController: widget.skuController,
                      warningStockController: widget.warningStockController,
                      idealStockController: widget.idealStockController,
                      costController: widget.costController,
                    ),
                    const InventoryPerBranch(),
                    const UIVerticalSpace(30.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: UIButton.secondary(
                        'Save Variant',
                        onClick: () {
                          final variant = _variantFormCubit.state.variant;

                          if (widget.formKey.currentState?.validate() == true &&
                              variant?.hasSuppliers == true &&
                              variant?.hasBranchInventories == true) {
                            if (variant?.id == null) {
                              final newVariant = variant?.copyWith(id: -(const Uuid().v4().hashCode));
                              context.read<ProductFormCubit>().addVariant(newVariant!);
                            } else {
                              context.read<ProductFormCubit>().updateVariant(variant!.id!, variant);
                            }

                            context.read<VariantFormUiCubit>().hideVariantFormUi();
                            _variantFormCubit.resetForm();
                          } else {
                            ToastNotification.invalid(
                                context, 'One of the required field is empty. Please check your inputs.');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const UIVerticalSpace(30.0),
          ],
        );
      },
    );
  }
}
