import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TypeAheadDropdown<T> extends StatefulWidget {
  const TypeAheadDropdown({
    super.key,
    required this.hint,
    required this.onSelected,
    required this.itemAsString,
    required this.suggestionCallback,
  });

  final String hint;
  final void Function(T value) onSelected;
  final String Function(T value) itemAsString;
  final Future<List<T>?> Function(String) suggestionCallback;

  @override
  State<TypeAheadDropdown<T>> createState() => _TypeAheadDropdownState<T>();
}

class _TypeAheadDropdownState<T> extends State<TypeAheadDropdown<T>> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TypeAheadField<T>(
        suggestionsCallback: (search) => widget.suggestionCallback(search),
        constraints: const BoxConstraints(maxHeight: 200),
        builder: (context, _, focusNode) {
          return TextField(
            controller: _controller,
            focusNode: focusNode
              ..addListener(() {
                if (!focusNode.hasFocus) _controller.clear();
              }),
            cursorHeight: 15,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: UIStyleText.hint,
              constraints: const BoxConstraints(maxHeight: 38),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Assets.icons.arrowDown.setSize(14),
              ),
              suffixIconConstraints: const BoxConstraints(maxWidth: 48, maxHeight: 30),
            ),
          );
        },
        offset: const Offset(0, 8),
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
        itemBuilder: (BuildContext context, T value) => HoverBuilder(
          builder: (isHover) => ListTile(
            tileColor: isHover ? UIColors.whiteBg : UIColors.transparent,
            title: UIText.bodyRegular(widget.itemAsString(value)),
          ),
        ),
        debounceDuration: const Duration(milliseconds: 800),
        hideOnSelect: true,
        hideOnUnfocus: true,
        loadingBuilder: (context) =>
            const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),
        errorBuilder: (context, error) => const Center(child: Text('Something went wrong.')),
        emptyBuilder: (context) => const Center(child: Text('No results found.')),
        onSelected: (value) => widget.onSelected(value),
        controller: _controller,
      );
}
