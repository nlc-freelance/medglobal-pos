import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DropdownList<T> extends StatefulWidget {
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
  State<DropdownList<T>> createState() => _DropdownListState<T>();
}

class _DropdownListState<T> extends State<DropdownList<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    double itemHeight = 40;
    double totalHeight = (items.isEmpty ? items.length : 3) * itemHeight;
    double height = totalHeight > 200 ? 200 : totalHeight;

    return Container(
      width: (widget.menuKey.currentContext?.findRenderObject() as RenderBox).size.width,
      height: height,
      decoration: BoxDecoration(
        color: UIColors.background,
        border: Border.all(color: UIColors.borderRegular),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Material(
            type: MaterialType.transparency,
            child: ListTile(
              onTap: () {
                final item = items[index];
                widget.onChanged(item);
              },
              dense: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: UIText.labelMedium(widget.getName(items[index])),
            ),
          );
        },
      ),
    );
  }
}
