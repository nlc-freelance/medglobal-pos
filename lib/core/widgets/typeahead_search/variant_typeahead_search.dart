import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class VariantTypeAheadSearch extends StatefulWidget {
  const VariantTypeAheadSearch({super.key, required this.onSelected, required this.onClear});

  final void Function(ProductVariantDto value) onSelected;
  final VoidCallback onClear;

  @override
  State<VariantTypeAheadSearch> createState() => _VariantTypeAheadSearchState();
}

class _VariantTypeAheadSearchState extends State<VariantTypeAheadSearch> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TypeAheadField<ProductVariantDto>(
        suggestionsCallback: (search) async => await GetIt.I<ProductVariantApi>().getProductVariants(search: search),
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
                visible: _controller.text.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      _controller.clear();
                      setState(() {});
                      widget.onClear();
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
        itemBuilder: (BuildContext context, ProductVariantDto value) => HoverBuilder(
          builder: (isHover) => ListTile(
            tileColor: isHover ? UIColors.whiteBg : UIColors.transparent,
            title: UIText.bodyRegular(value.displayName!),
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
          _controller.text = value.displayName!;
          widget.onSelected(value);
        },
        controller: _controller,
      );
}
