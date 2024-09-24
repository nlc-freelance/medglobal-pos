import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/widgets/add_category_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({
    super.key,
    this.selectedItem,
    required this.onChanged,
  });

  final Function(Category value) onChanged;
  final Category? selectedItem;

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category? _addedCategoryAsSelectedItem;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            right: 0,
            top: 21,
            child: Material(
              color: UIColors.background,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                onTap: () => showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const AddCategoryDialog(),
                ),
                child: Container(
                  height: 41.5,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: UIColors.borderRegular),
                      bottom: BorderSide(color: UIColors.borderRegular),
                      right: BorderSide(color: UIColors.borderRegular),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Assets.icons.add.svg(colorFilter: UIColors.textRegular.toColorFilter, width: 12),
                ),
              ),
            ),
          ),
          BlocListener<CategoryCubit, CategoryState>(
            listener: (context, state) {
              if (state is CategorySuccess) {
                setState(() => _addedCategoryAsSelectedItem = state.category);
                widget.onChanged(state.category);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 31.0),
              child: _CategoryDropdownOverlay(
                selectedItem: widget.selectedItem ?? _addedCategoryAsSelectedItem,
                onSelectItem: (category) => widget.onChanged(category),
              ),
            ),
          ),
        ],
      );
}

class _CategoryDropdownOverlay extends StatefulWidget {
  const _CategoryDropdownOverlay({
    this.onSelectItem,
    this.selectedItem,
  });

  final Function(Category value)? onSelectItem;
  final Category? selectedItem;

  @override
  State<_CategoryDropdownOverlay> createState() => _CategoryDropdownOverlayState();
}

class _CategoryDropdownOverlayState extends State<_CategoryDropdownOverlay> {
  final GlobalKey _menuKey = GlobalKey();
  late ScrollController _scrollController;

  bool _isVisible = false;
  Category? _selectedItem;

  @override
  void initState() {
    super.initState();
    setState(() => _selectedItem = widget.selectedItem);
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<CategoryLazyListCubit>().getCategories();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !context.read<CategoryLazyListCubit>().state.isLoadingMore &&
        !context.read<CategoryLazyListCubit>().state.hasReachedMax) {
      context.read<CategoryLazyListCubit>().getCategories();
    }
  }

  @override
  void didUpdateWidget(covariant _CategoryDropdownOverlay oldWidget) {
    setState(() => _selectedItem = widget.selectedItem);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.labelRegular('Category'),
        const UIVerticalSpace(7),
        UIPopupMenuOverlay(
          menu: InkWell(
            key: _menuKey,
            hoverColor: UIColors.transparent,
            highlightColor: UIColors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            onTap: () => setState(() => _isVisible = true),
            child: TextFormField(
              readOnly: true,
              enabled: false,
              controller: TextEditingController(text: _selectedItem?.name),
              mouseCursor: SystemMouseCursors.click,
              showCursor: false,
              style: UIStyleText.chip.copyWith(color: UIColors.textDark),
              decoration: InputDecoration(
                hintText: 'Select category',
                suffixIcon: Assets.icons.arrowDown.svg(),
                suffixIconConstraints: const BoxConstraints.tightFor(width: 48, height: 12),
              ),
            ),
          ),
          body: BlocBuilder<CategoryLazyListCubit, CategoryLazyListState>(
            builder: (context, state) {
              final categoryList = [const Category(id: -1, name: 'No Category'), ...state.categories];

              double itemHeight = 40;
              double totalHeight = (state.categories.isNotEmpty ? categoryList.length : 3) * itemHeight;
              double height = totalHeight > 200 ? 200 : totalHeight;

              return Container(
                width: (_menuKey.currentContext?.findRenderObject() as RenderBox).size.width,
                height: height,
                decoration: BoxDecoration(
                  color: UIColors.background,
                  border: Border.all(color: UIColors.borderRegular),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.INITIAL_LOADING)
                      const CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)
                    else if (state.EMPTY)
                      UIText.labelMedium('No data available', align: TextAlign.center)
                    else if (state.ERROR)
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UIText.labelMedium(state.error!, align: TextAlign.center),
                            UIButton.text('Reload',
                                onClick: () => context.read<CategoryLazyListCubit>().getCategories())
                          ],
                        ),
                      )
                    else ...[
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            return Material(
                              type: MaterialType.transparency,
                              child: ListTile(
                                onTap: () {
                                  final category = categoryList[index];

                                  if (category.id == -1) {
                                    setState(() => _selectedItem = null);
                                  } else {
                                    setState(() => _selectedItem = category);
                                    widget.onSelectItem!(category);
                                  }

                                  setState(() => _isVisible = false);
                                },
                                dense: true,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                title: UIText.labelMedium(categoryList[index].name!),
                              ),
                            );
                          },
                        ),
                      ),
                      if (!state.hasReachedMax && state.isLoadingMore)
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                          ),
                        ),
                    ],
                  ],
                ),
              );
            },
          ),
          visible: _isVisible,
          onClose: () => setState(() => _isVisible = false),
        ),
      ],
    );
  }
}
