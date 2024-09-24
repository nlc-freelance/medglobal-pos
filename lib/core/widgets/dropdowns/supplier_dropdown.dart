import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_lazy_list/supplier_lazy_list_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum SupplierDropdownType { select, input_top, input_left }

class SupplierDropdown extends StatelessWidget {
  const SupplierDropdown._({
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

  final SupplierDropdownType type;
  final String? label;
  final String? hint;

  final bool required;
  final bool isMultiSelect;
  final bool showSelectedItems;
  final Function(Supplier value)? onSelectItem;
  final Supplier? selectedItem;
  final List<Supplier>? selectedItems;
  final Function(int value)? onDeleteItem;

  factory SupplierDropdown.select({
    required Function(Supplier value)? onSelectItem,
    Key? key,
  }) =>
      SupplierDropdown._(
        key: key,
        type: SupplierDropdownType.select,
        onSelectItem: onSelectItem,
      );

  factory SupplierDropdown.input_top({
    required String hint,
    required String label,
    bool required = false,
    bool isMultiSelect = false,
    bool showSelectedItems = false,
    Function(Supplier value)? onSelectItem,
    List<Supplier>? selectedItems,
    Supplier? selectedItem,
    Function(int value)? onDeleteItem,
    Key? key,
  }) =>
      SupplierDropdown._(
        key: key,
        type: SupplierDropdownType.input_top,
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

  factory SupplierDropdown.input_left({
    required String hint,
    required String label,
    bool required = false,
    Function(Supplier value)? onSelectItem,
    Supplier? selectedItem,
    Key? key,
  }) =>
      SupplierDropdown._(
        key: key,
        type: SupplierDropdownType.input_left,
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
        style: type == SupplierDropdownType.input_top ? UIStyleText.labelRegular : UIStyleText.labelMedium,
        children: [
          if (required)
            TextSpan(
              text: ' *',
              style: (type == SupplierDropdownType.input_top ? UIStyleText.labelRegular : UIStyleText.labelMedium)
                  .copyWith(
                color: UIColors.accent,
              ),
            ),
        ],
      ),
    );

    switch (type) {
      case SupplierDropdownType.select:
        return _SupplierDropdownOverlay(
          isSelectType: true,
          hint: hint,
          onSelectItem: onSelectItem,
        );
      case SupplierDropdownType.input_top:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textLabel,
            const UIVerticalSpace(7),
            isMultiSelect
                ? _SupplierDropdownOverlay(
                    hint: hint,
                    isMultiSelect: true,
                    onDeleteItem: onDeleteItem,
                    onSelectItem: onSelectItem,
                    selectedItems: selectedItems,
                  )
                : _SupplierDropdownOverlay(
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

      case SupplierDropdownType.input_left:
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
                    child: _SupplierDropdownOverlay(
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

class _SupplierDropdownOverlay extends StatefulWidget {
  const _SupplierDropdownOverlay({
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
  final Function(Supplier value)? onSelectItem;
  final List<Supplier>? selectedItems;
  final Supplier? selectedItem;
  final Function(int value)? onDeleteItem;

  @override
  State<_SupplierDropdownOverlay> createState() => _SupplierDropdownOverlayState();
}

class _SupplierDropdownOverlayState extends State<_SupplierDropdownOverlay> {
  final GlobalKey _menuKey = GlobalKey();
  late ScrollController _scrollController;

  bool _isVisible = false;
  Supplier? _selectedItem;

  @override
  void initState() {
    super.initState();
    setState(() => _selectedItem = widget.selectedItem);

    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<SupplierLazyListCubit>().getSuppliers();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !context.read<SupplierLazyListCubit>().state.isLoadingMore &&
        !context.read<SupplierLazyListCubit>().state.hasReachedMax) {
      context.read<SupplierLazyListCubit>().getSuppliers();
    }
  }

  @override
  void didUpdateWidget(covariant _SupplierDropdownOverlay oldWidget) {
    setState(() => _selectedItem = widget.selectedItem);
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
            ? HoverBuilder(
                builder: (isHover) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: UIColors.background,
                    border: Border.all(color: isHover ? UIColors.buttonPrimaryHover : UIColors.borderRegular),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UIText.labelMedium(
                        _selectedItem != null ? _selectedItem!.name : 'All Suppliers',
                        color: isHover ? UIColors.primary : UIColors.textRegular,
                      ),
                      const UIHorizontalSpace(30),
                      Assets.icons.arrowDown.setColorOnHover(isHover)
                    ],
                  ),
                ),
              )
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
      body: BlocBuilder<SupplierLazyListCubit, SupplierLazyListState>(
        builder: (context, state) {
          double itemHeight = widget.isMultiSelect ? 48 : 40;
          double totalHeight = (state.suppliers.isNotEmpty ? state.suppliers.length : 3) * itemHeight;
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
                        UIButton.text('Reload', onClick: () => context.read<SupplierLazyListCubit>().getSuppliers())
                      ],
                    ),
                  )
                else ...[
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.suppliers.length,
                      itemBuilder: (context, index) {
                        final isSelected =
                            widget.selectedItems?.where((i) => state.suppliers[index].id == i.id).isNotEmpty == true;

                        return Material(
                          type: MaterialType.transparency,
                          child: ListTile(
                            onTap: () {
                              final supplier = state.suppliers[index];

                              /// Multi select
                              if (widget.isMultiSelect) {
                                if (widget.onDeleteItem != null) {
                                  isSelected ? widget.onDeleteItem!(supplier.id!) : widget.onSelectItem!(supplier);
                                } else {
                                  widget.onSelectItem!(supplier);
                                }
                              }

                              /// Single select
                              else {
                                setState(() => _selectedItem = supplier);
                                widget.onSelectItem!(supplier);

                                setState(() => _isVisible = false);
                              }
                            },
                            dense: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: UIText.labelMedium(state.suppliers[index].name)),
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
