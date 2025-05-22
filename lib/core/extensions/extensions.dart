import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

extension ColorFilterExt on Color {
  ColorFilter get toColorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}

extension SvgExt on SvgGenImage {
  SvgPicture setSize(double size) => this.svg(width: size, height: size);

  SvgPicture setColorOnHover(isHover) => this.svg(
        width: 12.0,
        height: 12.0,
        colorFilter: (isHover ? UIColors.primary : UIColors.textRegular).toColorFilter,
      );
}

extension IndexedTreeNodeExt on ITreeNode {
  bool get hasAnyExpandableChildren => childrenAsList.any((child) => child.childrenAsList.isNotEmpty);

  ITreeNode getNodeKeyOfCurrentMenu(String menu) =>
      childrenAsList.firstWhere((parent) => parent.childrenAsList.any((child) => child.key == menu),
          orElse: () => IndexedTreeNode(key: key)) as ITreeNode;
}

extension PathTransformExt on String {
  String get transformPathToText {
    // Remove leading and trailing slashes
    String trimmedText = replaceAll(RegExp(r'^/+|/+$'), '');

    // Replace "-" with space
    String replacedText = trimmedText.replaceAll('-', ' ');

    // Split the text by "/"
    List<String> parts = replacedText.split('/');

    // Capitalize the first letter of each word
    parts = parts.map((part) {
      return part.split(' ').map((word) {
        return word[0].toUpperCase() + word.substring(1);
      }).join(' ');
    }).toList();

    // Join the transformed parts with " / "
    String transformedText = parts.join('  /  ');

    return transformedText;
  }
}

extension DataGridRowExt on DataGridRow {
  int get id => getCells().first.value;
}

extension StringAsCurrency on String? {
  /// Convert a String to Double, rounds up and formats to 2 decimal places
  String toPesoString() => this != null ? (double.tryParse(this!) ?? 0).toStringAsFixed(2) : '0.00';
}

extension DoubleAsCurrency on double? {
  /// Rounds up and formats to 2 decimal places, if null returns '0.00'
  String toPesoString() => this != null ? this!.toStringAsFixed(2) : '0.00';

  double roundToTwoDecimalPlaces() => this != null ? (this! * 100).round() / 100 : 0.00;
}

/// Extension to safely get the first element that matches a condition
/// Returns null if no item is found (instead of throwing an error)
extension SafeFirstWhereExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final item in this) {
      if (test(item)) return item;
    }
    return null;
  }
}
