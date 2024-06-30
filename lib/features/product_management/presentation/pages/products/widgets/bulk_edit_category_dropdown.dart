import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/core.dart';
import '../../../../domain/entities/category.dart';
import '../../../bloc/category/category_bloc.dart';
import '../../widgets/add_category_dropdown_option.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// This is a custom dropdown made for bulk edit category displayed inside a popup that uses overlay.
/// It is created specifically because the app's dropdown widget is custom-made using an overlay as well.
/// However, an overlay on top of an overlay does not work.
class BulkEditCategoryDropdown extends StatefulWidget {
  const BulkEditCategoryDropdown({
    super.key,
    required this.hide,
    required this.label,
    required this.hint,
    required this.onSelect,
  });

  final bool hide;
  final String label;
  final String hint;
  final void Function(Category category) onSelect;

  @override
  State<BulkEditCategoryDropdown> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<BulkEditCategoryDropdown> {
  late TextEditingController _searchController;
  late ScrollController _scrollController;
  late CategoryBloc _categoryBloc;

  bool _showDropdown = false;
  Category? _selectedCategory;
  List<Category> items = [];

  @override
  void initState() {
    super.initState();
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(const GetCategories());

    _searchController = TextEditingController();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _categoryBloc.add(const GetCategories(isLoadMore: true));
    }
  }

  @override
  void didUpdateWidget(covariant BulkEditCategoryDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    _showDropdown = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryListLoaded) setState(() => items = state.categories);
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            UIText.labelRegular(widget.label),
            const UIVerticalSpace(4.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: UIColors.borderMuted),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              width: 260,
              child: ListTile(
                onTap: () => setState(() => _showDropdown = !_showDropdown),
                title: _selectedCategory != null
                    ? UIText.bodyRegular(_selectedCategory!.name)
                    : Text(widget.hint, style: UIStyleText.hint),
                trailing: Assets.icons.arrowDown.svg(width: 12.0, colorFilter: UIColors.textRegular.toColorFilter),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                dense: true,
                visualDensity: VisualDensity.compact,
              ),
            ),
            if (_showDropdown)
              Container(
                constraints: const BoxConstraints(maxHeight: 300, maxWidth: 260.0),
                margin: const EdgeInsets.only(top: 4.0),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AddCategoryDropdownOption(onAddCategory: (value) {
                      setState(() => _selectedCategory = value);
                      widget.onSelect(_selectedCategory!);
                    }),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //   child: UITextField.noLabel(controller: _searchController),
                    // ),
                    if (items.isNotEmpty)
                      Expanded(
                        child: Material(
                          type: MaterialType.transparency,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            controller: _scrollController,
                            itemCount: items.length,
                            itemBuilder: (_, index) => ListTile(
                              onTap: () {
                                widget.onSelect(items[index]);
                                setState(() => _selectedCategory = items[index]);
                              },
                              title: UIText.bodyRegular(items[index].name),
                            ),
                          ),
                        ),
                      ),
                    if (state is CategoryListLoading)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(
                          color: UIColors.primary,
                          strokeWidth: 2,
                        ),
                      ),
                    if (state is CategoryListError) Text(state.message),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
