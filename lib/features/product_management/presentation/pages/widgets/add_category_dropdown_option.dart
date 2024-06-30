import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.dart';
import '../../../domain/entities/category.dart';
import '../../bloc/category/category_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AddCategoryDropdownOption extends StatefulWidget with DialogMixin {
  const AddCategoryDropdownOption({super.key, required this.onAddCategory});

  final void Function(Category category) onAddCategory;

  @override
  State<AddCategoryDropdownOption> createState() => _AddCategoryButtonState();
}

class _AddCategoryButtonState extends State<AddCategoryDropdownOption> {
  late TextEditingController _categoryController;
  String? error;

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryActionSuccess) {
                  widget.onAddCategory(state.category);
                  Navigator.pop(context);
                }
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
                        if (state is CategoryActionError) ...[
                          UIText.labelMedium(state.message, color: UIColors.accent),
                          const UIVerticalSpace(4.0),
                        ],
                        UITextField.noLabel(
                          hint: 'Enter category name',
                          width: MediaQuery.sizeOf(context).width, // * 0.35,
                          controller: _categoryController,
                        ),
                        const UIVerticalSpace(16),
                        IgnorePointer(
                          ignoring: state is CategoryActionLoading,
                          child: CancelActionButton(
                            isLoading: state is CategoryActionLoading,
                            onCancel: () => Navigator.pop(context),
                            onAction: () => context.read<CategoryBloc>().add(AddCategory(_categoryController.text)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        leading: Assets.icons.add.svg(width: 12.0, colorFilter: UIColors.primary.toColorFilter),
        title: UIText.labelSemiBold('Add new category', color: UIColors.primary),
        minLeadingWidth: 2.0,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        visualDensity: VisualDensity.compact,
        hoverColor: UIColors.whiteBg,
      ),
    );
  }
}
