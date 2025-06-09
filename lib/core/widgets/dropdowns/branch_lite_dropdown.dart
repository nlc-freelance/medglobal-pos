import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// Custom lazy loading dropdown using Portal and Bloc
/// For future refactor, transform to a reusable dropdown and pass generic types and blocs
/// Currently implemented in different types (BranchLiteDropdown, SupplierDropdown, CategoryDropdown, RegisterDropdown)

enum BranchLiteDropdownType { select, input_top, input_left }

class BranchLiteDropdown extends StatelessWidget {
  const BranchLiteDropdown._({
    super.key,
    required this.type,
    this.hint,
    this.label,
    this.isInlineHint = false,
    this.required = false,
    this.isReadOnly = false,
    this.isSelectInputType = false,
    this.isMultiSelect = false,
    this.showSelectedItems = false,
    this.onSelectItem,
    this.selectedItem,
    this.selectedItems,
    this.onDeleteItem,
    this.onRemoveSelectedItem,
  });

  final BranchLiteDropdownType type;
  final String? label;
  final String? hint;
  final bool required;
  final bool isReadOnly;
  final bool isInlineHint;
  final bool isSelectInputType;
  final bool isMultiSelect;
  final bool showSelectedItems;
  final Function(BranchLite value)? onSelectItem;
  final BranchLite? selectedItem;
  final List<BranchLite>? selectedItems;
  final Function(int value)? onDeleteItem;
  final VoidCallback? onRemoveSelectedItem;

  factory BranchLiteDropdown.select({
    required Function(BranchLite value)? onSelectItem,
    VoidCallback? onRemoveSelectedItem,
    String? hint,
    bool isInlineHint = false,
    bool isSelectInputType = false,
    BranchLite? selectedItem,
    Key? key,
  }) =>
      BranchLiteDropdown._(
        key: key,
        type: BranchLiteDropdownType.select,
        hint: hint,
        isInlineHint: isInlineHint,
        isSelectInputType: isSelectInputType,
        onSelectItem: onSelectItem,
        selectedItem: selectedItem,
        onRemoveSelectedItem: onRemoveSelectedItem,
      );

  factory BranchLiteDropdown.input_top({
    required String hint,
    required String label,
    bool required = false,
    bool isReadOnly = false,
    bool isMultiSelect = false,
    bool showSelectedItems = false,
    required Function(BranchLite value) onSelectItem,
    List<BranchLite>? selectedItems,
    BranchLite? selectedItem,
    Function(int value)? onDeleteItem,
    Key? key,
  }) =>
      BranchLiteDropdown._(
        key: key,
        type: BranchLiteDropdownType.input_top,
        label: label,
        hint: hint,
        required: required,
        isReadOnly: isReadOnly,
        isMultiSelect: isMultiSelect,
        showSelectedItems: showSelectedItems,
        onSelectItem: onSelectItem,
        selectedItem: selectedItem,
        selectedItems: selectedItems,
        onDeleteItem: onDeleteItem,
      );

  factory BranchLiteDropdown.input_left({
    required String hint,
    required String label,
    bool required = false,
    bool isReadOnly = false,
    Function(BranchLite value)? onSelectItem,
    BranchLite? selectedItem,
    Key? key,
  }) =>
      BranchLiteDropdown._(
        key: key,
        type: BranchLiteDropdownType.input_left,
        label: label,
        hint: hint,
        required: required,
        isReadOnly: isReadOnly,
        onSelectItem: onSelectItem,
        selectedItem: selectedItem,
      );

  @override
  Widget build(BuildContext context) {
    final textLabel = Text.rich(
      TextSpan(
        text: label,
        style: type == BranchLiteDropdownType.input_top
            ? UIStyleText.labelRegular.copyWith(fontSize: 11)
            : UIStyleText.labelMedium,
        children: [
          if (required)
            TextSpan(
              text: ' *',
              style: (type == BranchLiteDropdownType.input_top
                      ? UIStyleText.labelRegular.copyWith(fontSize: 11)
                      : UIStyleText.labelMedium)
                  .copyWith(
                color: UIColors.accent,
              ),
            ),
        ],
      ),
    );

    switch (type) {
      case BranchLiteDropdownType.select:
        return _BranchLiteDropdownOverlay(
          isSelectType: true,
          hint: hint,
          isInlineHint: isInlineHint,
          isSelectInputType: isSelectInputType,
          onSelectItem: onSelectItem,
          selectedItem: selectedItem,
          onRemoveSelectedItem: onRemoveSelectedItem,
        );
      case BranchLiteDropdownType.input_top:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textLabel,
            const UIVerticalSpace(7),
            isMultiSelect
                ? _BranchLiteDropdownOverlay(
                    hint: hint,
                    isMultiSelect: true,
                    isReadOnly: isReadOnly,
                    onDeleteItem: onDeleteItem,
                    onSelectItem: onSelectItem,
                    selectedItems: selectedItems,
                  )
                : _BranchLiteDropdownOverlay(
                    hint: hint,
                    isReadOnly: isReadOnly,
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

      case BranchLiteDropdownType.input_left:
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
                    child: _BranchLiteDropdownOverlay(
                      hint: hint,
                      isReadOnly: isReadOnly,
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

class _BranchLiteDropdownOverlay extends StatefulWidget {
  const _BranchLiteDropdownOverlay({
    this.hint,
    this.isInlineHint,
    this.isSelectType = false,
    this.isSelectInputType = false,
    this.isMultiSelect = false,
    this.isReadOnly = false,
    this.onSelectItem,
    this.selectedItem,
    this.selectedItems,
    this.onDeleteItem,
    this.onRemoveSelectedItem,
  });

  final bool isSelectType;
  final bool isSelectInputType;
  final bool isMultiSelect;
  final bool isReadOnly;
  final String? hint;
  final bool? isInlineHint;
  final Function(BranchLite value)? onSelectItem;
  final List<BranchLite>? selectedItems;
  final BranchLite? selectedItem;
  final Function(int value)? onDeleteItem;
  final VoidCallback? onRemoveSelectedItem;

  @override
  State<_BranchLiteDropdownOverlay> createState() => _BranchLiteDropdownOverlayState();
}

class _BranchLiteDropdownOverlayState extends State<_BranchLiteDropdownOverlay> {
  final GlobalKey _menuKey = GlobalKey();
  late ScrollController _scrollController;

  bool _isVisible = false;
  BranchLite? _selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.selectedItem != null) setState(() => _selectedItem = widget.selectedItem);
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<LazyListBloc<BranchLite>>().add(const LazyListEvent<BranchLite>.fetch());
    // context.read<BranchLiteLazyListCubit>().getBranchLitees();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !context.read<LazyListBloc<BranchLite>>().state.isLoadingMore &&
        !context.read<LazyListBloc<BranchLite>>().state.hasReachedMax) {
      // !context.read<BranchLiteLazyListCubit>().state.isLoadingMore &&
      // !context.read<BranchLiteLazyListCubit>().state.hasReachedMax) {
      context.read<LazyListBloc<BranchLite>>().add(const LazyListEvent<BranchLite>.fetch());

      // context.read<BranchLiteLazyListCubit>().getBranchLitees();
    }
  }

  @override
  void didUpdateWidget(covariant _BranchLiteDropdownOverlay oldWidget) {
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
        onTap: () => widget.isReadOnly ? {} : setState(() => _isVisible = true),
        child: widget.isSelectType
            ? HoverBuilder(
                builder: (isHover) {
                  final highlight = _selectedItem != null && _selectedItem?.id != -1;
                  return Container(
                    constraints: const BoxConstraints(minWidth: 180),
                    padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: highlight && widget.isSelectInputType == false
                          ? UIColors.secondary
                          : isHover
                              ? UIColors.whiteBg
                              : UIColors.background,
                      border: Border.all(
                        color: highlight && widget.isSelectInputType == false
                            ? UIColors.primary.withOpacity(0.2)
                            : UIColors.borderRegular,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.isInlineHint == true
                            ? Text.rich(
                                TextSpan(
                                  text: widget.hint!,
                                  style: UIStyleText.labelMedium.copyWith(color: UIColors.textMuted),
                                  children: [
                                    TextSpan(
                                      text: '  ${_selectedItem != null ? _selectedItem!.name : 'All BranchLitees'}',
                                      style: UIStyleText.labelMedium.copyWith(
                                        color: _selectedItem != null ? UIColors.primary : UIColors.textLight,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : widget.isSelectInputType == true

                                /// Select type for input
                                ? Text(
                                    _selectedItem != null ? _selectedItem!.name : 'Select branch',
                                    style: UIStyleText.hint.copyWith(
                                      color: _selectedItem != null ? UIColors.textRegular : UIColors.textMuted,
                                      fontWeight: _selectedItem != null ? FontWeight.w500 : FontWeight.w400,
                                    ),
                                  )

                                /// Select type for selecting e.g., filter
                                : UIText.labelMedium(
                                    _selectedItem != null ? _selectedItem!.name : 'All BranchLitees',
                                    color: _selectedItem != null ? UIColors.primary : UIColors.textLight,
                                  ),
                        const UIHorizontalSpace(10),
                        _selectedItem != null && widget.onRemoveSelectedItem != null
                            ? SizedBox(
                                height: 18,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {
                                    setState(() => _selectedItem = null);
                                    widget.onRemoveSelectedItem!();
                                  },
                                  child: Assets.icons.close.svg(height: 22),
                                ),
                              )
                            : Assets.icons.arrowDown.svg(height: 10)
                      ],
                    ),
                  );
                },
              )
            : TextFormField(
                readOnly: true,
                enabled: false,
                controller: TextEditingController(text: _selectedItem?.name),
                mouseCursor: widget.isReadOnly ? null : SystemMouseCursors.click,
                showCursor: false,

                style: UIStyleText.chip.copyWith(color: UIColors.textDark),
                // TODO: Auto validation on user interaction, currently it only shows validation upon clicking 'Save'
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (_) {
                  if (widget.selectedItems?.isEmpty == true) {
                    return 'Please select branches to add product price and QOH.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: widget.hint,
                  suffixIcon: widget.isReadOnly
                      ? Assets.icons.lock.svg(colorFilter: UIColors.textMuted.toColorFilter)
                      : Assets.icons.arrowDown.svg(),
                  suffixIconConstraints: const BoxConstraints.tightFor(width: 48, height: 12),
                  fillColor: UIColors.borderMuted.withOpacity(0.5),
                  filled: widget.isReadOnly,
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: UIColors.borderRegular),
                  ),
                ),
              ),
      ),
      body: BlocBuilder<LazyListBloc<BranchLite>, LazyListState<BranchLite>>(
        // body: BlocBuilder<BranchLiteLazyListCubit, BranchLiteLazyListState>(
        builder: (context, state) {
          final branchList = state.items;
          // final branchList = state.branches;

          double itemHeight = widget.isMultiSelect ? 48 : 40;
          double totalHeight = (state.items.isNotEmpty ? branchList.length : 3) * itemHeight;
          // double totalHeight = (state.branches.isNotEmpty ? branchList.length : 3) * itemHeight;
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
                if (state.isLoadingInitial)
                  // if (state.INITIAL_LOADING)
                  const CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)
                else if (state.hasNoData)
                  // else if (state.EMPTY)
                  UIText.labelMedium('No data available', align: TextAlign.center)
                else if (state.error != null)
                  // else if (state.ERROR)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UIText.labelMedium(state.error!, align: TextAlign.center),
                        UIButton.text('Reload',
                            onClick: () => context.read<LazyListBloc<BranchLite>>().add(const LazyListEvent.fetch()))
                        // UIButton.text('Reload', onClick: () => context.read<BranchLiteLazyListCubit>().getBranchLitees())
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
                            contentPadding: EdgeInsets.zero,
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
                            title: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
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
