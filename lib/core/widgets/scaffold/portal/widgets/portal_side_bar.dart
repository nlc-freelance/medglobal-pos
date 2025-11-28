// import 'package:animated_tree_view/animated_tree_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';

// class PortalSidebar extends StatefulWidget {
//   final String currentMenu;

//   const PortalSidebar({required this.currentMenu, super.key});

//   @override
//   State<PortalSidebar> createState() => _SideNavBarState();
// }

// class _SideNavBarState extends State<PortalSidebar> {
//   late TreeViewController _controller;
//   late ITreeNode _selectedParentNode;

//   final sidebarTree = IndexedTreeNode.root()
//     ..addAll(
//       [
//         IndexedTreeNode(key: SideMenuTree.PRODUCTS.title)
//           ..addAll([
//             IndexedTreeNode(key: 'Suppliers'),
//             IndexedTreeNode(key: 'Products'),
//           ]),
//         IndexedTreeNode(key: SideMenuTree.STOCKS.title)
//           ..addAll([
//             IndexedTreeNode(key: 'Supply Needs'),
//             IndexedTreeNode(key: 'Purchase Orders'),
//             IndexedTreeNode(key: 'Stock Returns'),
//             IndexedTreeNode(key: 'Stock Takes'),
//             IndexedTreeNode(key: 'Stock Transfers'),
//           ]),
//         IndexedTreeNode(key: SideMenuTree.TRANSACTIONS.title)
//           ..addAll([
//             IndexedTreeNode(key: 'Sales'),
//             IndexedTreeNode(key: 'Returns'),
//           ]),
//         IndexedTreeNode(key: SideMenuTree.REPORTS.title)
//           ..addAll(
//             [
//               IndexedTreeNode(key: SideMenuTree.REPORTS.items[0]),
//               IndexedTreeNode(key: 'Product Performance'),
//               IndexedTreeNode(key: SideMenuTree.REPORTS.items[1])
//                 ..addAll([
//                   IndexedTreeNode(key: SideMenuTree.REPORTS.items[2]),
//                   IndexedTreeNode(key: SideMenuTree.REPORTS.items[3]),
//                 ]),
//             ],
//           ),
//         IndexedTreeNode(key: SideMenuTree.employee.title)
//           ..addAll([
//             IndexedTreeNode(key: 'Manage Employees'),
//           ]),
//         IndexedTreeNode(key: SideMenuTree.settings.title)
//           ..addAll([
//             IndexedTreeNode(key: SideMenuTree.settings.items[0]),
//             IndexedTreeNode(key: SideMenuTree.settings.items[1]),
//             IndexedTreeNode(key: SideMenuTree.settings.items[4]),
//             IndexedTreeNode(key: SideMenuTree.settings.items[5]),
//           ]),
//       ],
//     );

//   final sidebarTreePO = IndexedTreeNode.root()
//     ..addAll([
//       IndexedTreeNode(key: SideMenuTree.STOCKS.title)
//         ..addAll([
//           IndexedTreeNode(key: 'Purchase Orders'),
//         ]),
//     ]);

//   @override
//   Widget build(BuildContext context) => Drawer(
//         shape: const Border(right: BorderSide(color: UIColors.borderMuted)),
//         backgroundColor: UIColors.background,
//         child: ListView(
//           shrinkWrap: true,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Assets.images.logoDrawer.image(),
//                   ),
//                   IconButton(
//                     onPressed: context.read<SidebarCubit>().closeSideBar,
//                     icon: Assets.icons.arrowLeft.svg(),
//                   )
//                 ],
//               ),
//             ),
//             BlocSelector<AuthBloc, AuthState, UserType?>(
//               selector: (state) {
//                 if (state is AuthenticatedState) return state.user.type;
//                 return null;
//               },
//               builder: (context, userType) {
//                 return TreeView.indexed(
//                   tree: userType == UserType.STORE_MANAGER ? sidebarTreePO : sidebarTree,
//                   showRootNode: false,
//                   shrinkWrap: true,
//                   padding: EdgeInsets.zero,
//                   indentation: const Indentation(style: IndentStyle.none),
//                   expansionBehavior: ExpansionBehavior.collapseOthers,
//                   expansionIndicatorBuilder: (context, indicator) => CustomNodeTreeIcon(tree: sidebarTree),
//                   onItemTap: (node) => node.isLeaf
//                       ? node.key == 'productForm'
//                           // ? node.key == 'Add Product'
//                           ? AppRouter.router.pushNamed(node.key)
//                           : AppRouter.router.goNamed(node.key)
//                       : null,
//                   // onTreeReady: (controller) {
//                   //   _controller = controller;
//                   //   _selectedParentNode = _controller.elementAt(parentNodeKey);

//                   //   ITreeNode? selectedChildNode;

//                   //   if (_selectedParentNode.isExpanded) _controller.collapseNode(_selectedParentNode);

//                   //   if (_selectedParentNode.hasAnyExpandableChildren) {
//                   //     selectedChildNode = _selectedParentNode.getNodeKeyOfCurrentMenu(widget.currentMenu);
//                   //     _controller.collapseNode(selectedChildNode);
//                   //   }

//                   //   WidgetsBinding.instance.addPostFrameCallback((_) {
//                   //     _controller.expandNode(_selectedParentNode);
//                   //     if (_selectedParentNode.hasAnyExpandableChildren) _controller.expandNode(selectedChildNode!);
//                   //   });
//                   // },
//                   builder: (context, node) {
//                     final isSelected = widget.currentMenu == node.key;
//                     // sub expansion menu not open when something is selected upon toggle of parent
//                     return HoverBuilder(
//                       builder: (isHover) => Container(
//                         margin: const EdgeInsets.only(bottom: 4.0),
//                         decoration: BoxDecoration(
//                           color: isSelected || isHover ? UIColors.whiteBg : UIColors.transparent,
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(4.0),
//                             bottomLeft: Radius.circular(4.0),
//                             topRight: Radius.circular(12.0),
//                             bottomRight: Radius.circular(12.0),
//                           ),
//                           border: isSelected
//                               ? const Border(
//                                   left: BorderSide(
//                                     color: UIColors.accent,
//                                     width: 3.0,
//                                   ),
//                                 )
//                               : const Border(),
//                         ),
//                         child: ListTile(
//                           shape: shape,
//                           title: Text(node.key),
//                           titleTextStyle: style,
//                           horizontalTitleGap: 8.0,
//                           visualDensity: const VisualDensity(vertical: -4.0),
//                           // leading: icon(node.key)?.svg(
//                           //   width: 16.0,
//                           //   colorFilter:
//                           //       (isSelectedAsMenuItem(node) ? UIColors.primary : UIColors.textGray).toColorFilter,
//                           // ),
//                           // contentPadding: node.isLeaf
//                           //     ? EdgeInsets.only(left: node.level > 1 ? 30.0 : 10.0)
//                           //     : EdgeInsets.only(left: node.level == 2 ? 30.0 : 10.0),
//                           // selectedColor: UIColors.primary,
//                           // selected: isSelected || isSelectedAsMenuItem(node),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       );

//   bool isSelectedAsMenuItem(IndexedTreeNode node) =>
//       SideMenuTree.values.singleWhere((menu) => menu.items.contains(widget.currentMenu)).title == node.key;

//   String get parentNodeKey => SideMenuTree.values.singleWhere((menu) => menu.items.contains(widget.currentMenu)).title;

//   TextStyle get style => UIStyleText.heading6.copyWith(fontWeight: FontWeight.w500);

//   SvgGenImage? icon(String key) => switch (key) {
//         'Product Management' => Assets.icons.bagHappy,
//         'Stock Management' => Assets.icons.layer,
//         'Transactions' => Assets.icons.arrowSwapHorizontal,
//         'Returns Management' => Assets.icons.undo,
//         'Reports' => Assets.icons.presentionChart,
//         'Settings' => Assets.icons.settings,
//         'Employees' => Assets.icons.employees,
//         _ => null,
//       };

//   ShapeBorder get shape => const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(4.0),
//           bottomLeft: Radius.circular(4.0),
//           topRight: Radius.circular(12.0),
//           bottomRight: Radius.circular(12.0),
//         ),
//       );
// }

// class CustomNodeTreeIcon extends ExpansionIndicator {
//   CustomNodeTreeIcon({super.key, required super.tree});

//   @override
//   State<StatefulWidget> createState() => _CustomNodeTreeIconState();
// }

// class _CustomNodeTreeIconState extends State<CustomNodeTreeIcon> {
//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//         child: Assets.icons.arrowDown.setSize(12),
//       );
// }
