import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/cubit/branch_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// Custom lazy loading dropdown using Portal and Bloc
/// For future refactor, transform to a reusable dropdown and pass generic types and blocs
/// Currently implemented in different types (BranchDropdown, SupplierDropdown, CategoryDropdown, RegisterDropdown)

enum BranchDropdownType { select, input_top, input_left }

class BranchDropdown extends StatelessWidget {
  const BranchDropdown._({
    super.key,
    required this.type,
    this.hint,
    this.label,
    this.required = false,
    this.isMultiSelect = false,
    this.showSelectedItems = false,
    this.onSelectItem,
    this.selectedItem,
    this.selectedItems,
    this.onDeleteItem,
  });

  final BranchDropdownType type;
  final String? label;
  final String? hint;
  final bool required;
  final bool isMultiSelect;
  final bool showSelectedItems;
  final Function(Branch value)? onSelectItem;
  final Branch? selectedItem;
  final List<Branch>? selectedItems;
  final Function(int value)? onDeleteItem;

  factory BranchDropdown.select({
    required Function(Branch value)? onSelectItem,
    Key? key,
  }) =>
      BranchDropdown._(
        key: key,
        type: BranchDropdownType.select,
        onSelectItem: onSelectItem,
      );

  factory BranchDropdown.input_top({
    required String hint,
    required String label,
    bool required = false,
    bool isMultiSelect = false,
    bool showSelectedItems = false,
    Function(Branch value)? onSelectItem,
    List<Branch>? selectedItems,
    Branch? selectedItem,
    Function(int value)? onDeleteItem,
    Key? key,
  }) =>
      BranchDropdown._(
        key: key,
        type: BranchDropdownType.input_top,
        label: label,
        hint: hint,
        required: required,
        isMultiSelect: isMultiSelect,
        showSelectedItems: showSelectedItems,
        onSelectItem: onSelectItem,
        selectedItem: selectedItem,
        selectedItems: selectedItems,
        onDeleteItem: onDeleteItem,
      );

  factory BranchDropdown.input_left({
    required String hint,
    required String label,
    bool required = false,
    Function(Branch value)? onSelectItem,
    Branch? selectedItem,
    Key? key,
  }) =>
      BranchDropdown._(
        key: key,
        type: BranchDropdownType.input_left,
        label: label,
        hint: hint,
        required: required,
        onSelectItem: onSelectItem,
        selectedItem: selectedItem,
      );

  @override
  Widget build(BuildContext context) {
    final textLabel = Text.rich(
      TextSpan(
        text: label,
        style: type == BranchDropdownType.input_top ? UIStyleText.labelRegular : UIStyleText.labelMedium,
        children: [
          if (required)
            TextSpan(
              text: ' *',
              style:
                  (type == BranchDropdownType.input_top ? UIStyleText.labelRegular : UIStyleText.labelMedium).copyWith(
                color: UIColors.accent,
              ),
            ),
        ],
      ),
    );

    switch (type) {
      case BranchDropdownType.select:
        return _BranchDropdownOverlay(
          isSelectType: true,
          hint: hint,
          onSelectItem: onSelectItem,
        );
      case BranchDropdownType.input_top:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textLabel,
            const UIVerticalSpace(7),
            isMultiSelect
                ? _BranchDropdownOverlay(
                    hint: hint,
                    isMultiSelect: true,
                    onDeleteItem: onDeleteItem,
                    onSelectItem: onSelectItem,
                    selectedItems: selectedItems,
                  )
                : _BranchDropdownOverlay(
                    hint: hint,
                    onSelectItem: onSelectItem,
                    selectedItem: selectedItem,
                  ),
            const UIVerticalSpace(8),
            if (isMultiSelect && showSelectedItems)
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 6,
                spacing: 4,
                children: selectedItems!
                    .map(
                      (supplier) => Chip(
                        label: Text(supplier.name, style: UIStyleText.chip),
                        backgroundColor: UIColors.whiteBg,
                        deleteIcon: Assets.icons.close.svg(),
                        onDeleted: () => onDeleteItem != null ? onDeleteItem!(supplier.id!) : {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: UIColors.borderMuted, width: 0.8),
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        );

      case BranchDropdownType.input_left:
        return LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth > 1000 ? 650 : constraints.maxWidth,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: textLabel),
                  Expanded(
                    flex: 2,
                    child: _BranchDropdownOverlay(
                      hint: hint,
                      onSelectItem: onSelectItem,
                      selectedItem: selectedItem,
                    ),
                  ),
                ],
              ),
            );
          },
        );
    }
  }
}

class _BranchDropdownOverlay extends StatefulWidget {
  const _BranchDropdownOverlay({
    this.hint,
    this.isSelectType = false,
    this.isMultiSelect = false,
    this.onSelectItem,
    this.selectedItem,
    this.selectedItems,
    this.onDeleteItem,
  });

  final bool isSelectType;
  final bool isMultiSelect;
  final String? hint;
  final Function(Branch value)? onSelectItem;
  final List<Branch>? selectedItems;
  final Branch? selectedItem;
  final Function(int value)? onDeleteItem;

  @override
  State<_BranchDropdownOverlay> createState() => _BranchDropdownOverlayState();
}

class _BranchDropdownOverlayState extends State<_BranchDropdownOverlay> {
  final GlobalKey _menuKey = GlobalKey();
  late ScrollController _scrollController;

  bool _isVisible = false;
  Branch? _selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.selectedItem != null) setState(() => _selectedItem = widget.selectedItem);
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<BranchLazyListCubit>().getBranches();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !context.read<BranchLazyListCubit>().state.isLoadingMore &&
        !context.read<BranchLazyListCubit>().state.hasReachedMax) {
      context.read<BranchLazyListCubit>().getBranches();
    }
  }

  @override
  void didUpdateWidget(covariant _BranchDropdownOverlay oldWidget) {
    if (widget.selectedItem != null) setState(() => _selectedItem = widget.selectedItem);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return UIPopupMenuOverlay(
      menu: InkWell(
        key: _menuKey,
        hoverColor: UIColors.transparent,
        highlightColor: UIColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        onTap: () => setState(() => _isVisible = true),
        child: widget.isSelectType
            ? HoverBuilder(builder: (isHover) {
                final highlight = isHover || (_selectedItem != null && _selectedItem?.id != -1);
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: highlight ? UIColors.secondary : UIColors.background,
                    border: Border.all(color: highlight ? UIColors.primary.withOpacity(0.2) : UIColors.borderRegular),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIText.labelMedium(
                        _selectedItem != null ? _selectedItem!.name : 'All Branches',
                        color: highlight ? UIColors.primary : UIColors.textRegular,
                      ),
                      const UIHorizontalSpace(30),
                      Assets.icons.arrowDown.setColorOnHover(highlight)
                    ],
                  ),
                );
              })
            : TextFormField(
                readOnly: true,
                enabled: false,
                controller: TextEditingController(text: _selectedItem?.name),
                mouseCursor: SystemMouseCursors.click,
                showCursor: false,
                style: UIStyleText.chip.copyWith(color: UIColors.textDark),
                // TODO: Auto validation on user interaction, currently it only shows validation upon clicking 'Save'
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (_) {
                  if (widget.selectedItems?.isEmpty == true) return 'Please select at least one supplier.';
                  return null;
                },
                decoration: InputDecoration(
                  hintText: widget.hint,
                  suffixIcon: Assets.icons.arrowDown.svg(),
                  suffixIconConstraints: const BoxConstraints.tightFor(width: 48, height: 12),
                ),
              ),
      ),
      body: BlocBuilder<BranchLazyListCubit, BranchLazyListState>(
        builder: (context, state) {
          final branchList = [if (widget.isSelectType) const Branch(id: -1, name: 'All Branches'), ...state.branches];

          double itemHeight = widget.isMultiSelect ? 48 : 40;
          double totalHeight = (state.branches.isNotEmpty ? branchList.length : 3) * itemHeight;
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
                        UIButton.text('Reload', onClick: () => context.read<BranchLazyListCubit>().getBranches())
                      ],
                    ),
                  )
                else ...[
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: branchList.length,
                      itemBuilder: (context, index) {
                        final isSelected =
                            widget.selectedItems?.where((i) => branchList[index].id == i.id).isNotEmpty == true;

                        return Material(
                          type: MaterialType.transparency,
                          child: ListTile(
                            onTap: () {
                              final branch = branchList[index];

                              /// Multi select
                              if (widget.isMultiSelect) {
                                if (widget.onDeleteItem != null) {
                                  /// Unselect inside the dropdown
                                  isSelected ? widget.onDeleteItem!(branch.id!) : widget.onSelectItem!(branch);
                                } else {
                                  widget.onSelectItem!(branch);
                                }
                              }

                              /// Single select
                              else {
                                setState(() => _selectedItem = branch);
                                widget.onSelectItem!(branch);

                                setState(() => _isVisible = false);
                              }
                            },
                            dense: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: UIText.labelMedium(branchList[index].name),
                                ),
                                if (widget.isMultiSelect)
                                  Checkbox(
                                    value: isSelected,
                                    onChanged: null,
                                  ),
                              ],
                            ),
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
    );
  }
}
