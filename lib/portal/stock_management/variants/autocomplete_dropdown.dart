import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AutocompleteDropdown extends StatefulWidget {
  const AutocompleteDropdown({super.key, required this.onSelected, this.supplierId, this.branchId});

  final void Function(ProductVariantDto value) onSelected;
  final int? supplierId;
  final int? branchId;

  @override
  State<AutocompleteDropdown> createState() => _AutocompleteDropdownState();
}

class _AutocompleteDropdownState extends State<AutocompleteDropdown> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TypeAheadField<ProductVariantDto>(
        suggestionsCallback: (search) async => await GetIt.I<ProductVariantApi>()
            .getProductVariants(search: search, supplierId: widget.supplierId, branchId: widget.branchId),
        constraints: const BoxConstraints(maxHeight: 250),
        builder: (context, _, focusNode) {
          return TextField(
            controller: _controller,
            focusNode: focusNode
              ..addListener(() {
                if (!focusNode.hasFocus) _controller.clear();
              }),
            cursorHeight: 15,
            decoration: InputDecoration(
              hintText: 'Type to search items to add',
              hintStyle: UIStyleText.hint,
              constraints: const BoxConstraints(maxHeight: 38),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
              // contentPadding: EdgeInsets.zero,
              // border: InputBorder.none,
              // focusedBorder: InputBorder.none,
              // enabledBorder: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Assets.icons.search.setSize(14),
              ),
              prefixIconConstraints: const BoxConstraints(maxWidth: 48, maxHeight: 30),
            ),
          );
        },
        offset: const Offset(0, 12),
        decorationBuilder: (context, child) {
          return Material(
            color: UIColors.background,
            shadowColor: UIColors.borderMuted,
            elevation: 2,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: UIColors.borderMuted),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: child,
            ),
          );
        },
        itemBuilder: (BuildContext context, ProductVariantDto value) => HoverBuilder(
          builder: (isHover) => ListTile(
            tileColor: isHover ? UIColors.whiteBg : UIColors.transparent,
            title: UIText.bodyRegular(value.displayName!),
          ),
        ),
        debounceDuration: const Duration(milliseconds: 800),
        hideOnSelect: false,
        hideOnUnfocus: true,
        loadingBuilder: (context) =>
            const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),
        errorBuilder: (context, error) => const Center(child: Text('Something went wrong.')),
        emptyBuilder: (context) => const Center(child: Text('No items found.')),
        onSelected: (value) {
          widget.onSelected(value);
        },
        controller: _controller,
      );
}
