import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CategoryFormDialog extends StatefulWidget {
  const CategoryFormDialog({super.key});

  @override
  State<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends State<CategoryFormDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late CategoryBloc _bloc;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<CategoryBloc>();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: BlocListener<CategoryBloc, CategoryState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (category) {
              PageLoader.close();
              SnackbarUtil.success(context, 'Category "${category.name}" created successfully.');
              Navigator.pop(context);
            },
            processing: () => PageLoader.show(context),
            failure: (message) {
              PageLoader.close();
              SnackbarUtil.error(context, message);
            },
            orElse: () {},
          );
        },
        child: AppCustomDialog(
          title: 'Add Category',
          content: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField.top(
                  label: 'Category name',
                  hint: 'Enter category name',
                  controller: _nameController,
                  isRequired: true,
                  validator: FormValidators.required('Please enter a category name.'),
                ),
                const UIVerticalSpace(24),
              ],
            ),
          ),
          actions: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    failure: (message) => PageErrorBanner(message: message),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
                  const UIHorizontalSpace(8),
                  UIButton.filled('Save', onClick: _onSave),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSave() {
    if (_formKey.currentState?.validate() == true) {
      _bloc.add(CategoryEvent.createCategory(_nameController.text));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bloc.add(const CategoryEvent.reset());

    super.dispose();
  }
}
