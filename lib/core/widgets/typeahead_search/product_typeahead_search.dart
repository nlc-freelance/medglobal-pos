import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/product_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/product_dto.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductTypeAheadSearch extends StatefulWidget {
  const ProductTypeAheadSearch({super.key, this.selectedItem, required this.onSelected, this.onClear});

  final void Function(ProductDto value) onSelected;
  final ProductDto? selectedItem;
  final VoidCallback? onClear;

  @override
  State<ProductTypeAheadSearch> createState() => _ProductTypeAheadSearchState();
}

class _ProductTypeAheadSearchState extends State<ProductTypeAheadSearch> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.selectedItem?.name ?? Strings.empty);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TypeAheadField<ProductDto>(
        suggestionsCallback: (search) async => await GetIt.I<ProductApi>().getProductsBy(search: search),
        constraints: const BoxConstraints(maxHeight: 200),
        builder: (context, _, focusNode) {
          return TextField(
            controller: _controller,
            focusNode: focusNode,
            // ..addListener(() {
            //   if (!focusNode.hasFocus) _controller.clear();
            // }),
            style: UIStyleText.bodyRegular,
            cursorHeight: 14,
            decoration: InputDecoration(
              hintText: 'Search for a product',
              hintStyle: UIStyleText.hint,
              constraints: const BoxConstraints(maxHeight: 38),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Assets.icons.search.setSize(14),
              ),
              prefixIconConstraints: const BoxConstraints(maxWidth: 48, maxHeight: 30),
              suffixIcon: Visibility(
                visible: _controller.text.isNotEmpty && widget.onClear != null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      _controller.clear();
                      setState(() {});
                      widget.onClear!();
                    },
                    child: Assets.icons.close.setSize(18),
                  ),
                ),
              ),
              suffixIconConstraints: const BoxConstraints(maxWidth: 48, maxHeight: 30),
            ),
          );
        },
        offset: const Offset(0, 0),
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
        itemBuilder: (BuildContext context, ProductDto value) => HoverBuilder(
          builder: (isHover) => ListTile(
            tileColor: isHover ? UIColors.whiteBg : UIColors.transparent,
            title: UIText.bodyRegular(value.name),
          ),
        ),
        debounceDuration: const Duration(milliseconds: 500),
        hideOnSelect: true,
        hideOnUnfocus: true,
        loadingBuilder: (context) =>
            const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),
        errorBuilder: (context, error) => const Center(child: Text('Something went wrong.')),
        emptyBuilder: (context) => const Center(child: Text('No items found.')),
        onSelected: (value) {
          _controller.text = value.name;
          widget.onSelected(value);
        },
        controller: _controller,
      );
}
