import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

// TODO: Autocomplete Dropdown
class AutocompleteDropdown extends StatelessWidget {
  const AutocompleteDropdown({super.key});

  @override
  Widget build(BuildContext context) => TypeAheadField<String>(
        suggestionsCallback: (search) => [
          'food',
          'supplement',
          'medicine',
          'ana',
          'elsa',
          'tangled',
          'anastasia',
          'anabelle'
        ].where((e) => e.contains(search)).toList(),
        offset: const Offset(0, 2),
        constraints: const BoxConstraints(maxHeight: 260),
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Select category',
              constraints: BoxConstraints(maxHeight: 40),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: UIColors.borderRegular),
              ),
            ),
          );
        },
        decorationBuilder: (context, child) {
          return Material(
            color: UIColors.background,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: UIColors.borderMuted),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: child,
            ),
          );
        },
        itemBuilder: (BuildContext context, String value) => ListTile(
          title: UIText.bodyRegular(value),
        ),
        loadingBuilder: (context) =>
            const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),
        errorBuilder: (context, error) => const Center(child: Text('Something went wrong.')),
        emptyBuilder: (context) => const Center(child: Text('No items found.')),
        onSelected: (city) {},
      );
}
