import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DropdownList<T> extends StatelessWidget {
  const DropdownList({
    super.key,
    required this.menuKey,
    required this.onChanged,
    required this.getName,
    required this.items,
  });

  final List<T> items;
  final GlobalKey menuKey;
  final void Function(T item) onChanged;
  final String Function(T item) getName;

  @override
  Widget build(BuildContext context) {
    double itemHeight = 40;
    double totalHeight = (items.isEmpty ? 2 : items.length) * itemHeight;
    double height = totalHeight > 130 ? 130 : totalHeight;

    return Container(
      width: (menuKey.currentContext?.findRenderObject() as RenderBox).size.width,
      height: height,
      decoration: BoxDecoration(
        color: UIColors.background,
        border: Border.all(color: UIColors.borderRegular),
        borderRadius: BorderRadius.circular(12),
      ),
      child: items.isEmpty
          ? Center(child: UIText.labelMedium('No items available'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    onTap: () {
                      final item = items[index];
                      onChanged(item);
                    },
                    dense: true,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    title: UIText.labelMedium(getName(items[index])),
                  ),
                );
              },
            ),
    );
  }
}
