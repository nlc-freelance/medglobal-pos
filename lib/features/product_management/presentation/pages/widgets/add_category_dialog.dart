import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({super.key});

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  late TextEditingController _newCategoryController;
  bool _isInitialRebuild = false;

  @override
  void initState() {
    super.initState();
    setState(() => _isInitialRebuild = true);
    _newCategoryController = TextEditingController();
  }

  @override
  void dispose() {
    _newCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategorySuccess) {
            _newCategoryController.clear();
            Navigator.pop(context);
          }
          if (state is CategoryError) setState(() => _isInitialRebuild = false);
        },
        builder: (context, state) {
          return Dialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.35,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIText.heading6('Add new category'),
                  const Divider(color: UIColors.borderMuted),
                  const UIVerticalSpace(8.0),
                  if (state is CategoryError && !_isInitialRebuild) ...[
                    UIText.labelMedium(state.message, color: UIColors.accent),
                    const UIVerticalSpace(4.0),
                  ],
                  UITextField.noLabel(
                    hint: 'Enter category name',
                    width: MediaQuery.sizeOf(context).width, // * 0.35,
                    controller: _newCategoryController,
                  ),
                  const UIVerticalSpace(16),
                  IgnorePointer(
                    ignoring: state is CategoryLoading,
                    child: CancelActionButton(
                        isLoading: state is CategoryLoading,
                        onCancel: () {
                          _newCategoryController.clear();
                          Navigator.pop(context);
                        },
                        onAction: () => context.read<CategoryCubit>().addCategory(_newCategoryController.text)),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
