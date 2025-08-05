// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
// import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
// import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
// import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_cubit/product_catalog_cubit.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_closed.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_open.dart';
// import 'package:medglobal_admin_portal/pos/product_catalog/presentation/screens/product_catalog_data_grid.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
// import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
//
// class SalesScreen extends StatelessWidget {
//   static String route = '/pos/register';
//
//   const SalesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
//       builder: (context, state) {
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Catalog
//             Expanded(
//               flex: 8,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: UIColors.borderMuted, width: 1.0),
//                   borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     state.maybeWhen(
//                       open: (shift, _) => const ProductCatalog(),
//                       orElse: () => DataGridNoData(
//                         columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
//                         source: ProductCatalogDataSource([], context),
//                         isCustom: true,
//                         message: 'The register is currently closed.',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const UIHorizontalSpace(16),
//             // Cart
//             Expanded(
//               flex: 4,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: UIColors.borderMuted, width: 1.0),
//                   borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//                 ),
//                 child: state.maybeWhen(
//                   open: (_, __) => const CartOpen(),
//                   closed: (_) => const CartClosed(),
//                   orElse: () => const SizedBox(),
//                 ),
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
//
// class ProductCatalog extends StatefulWidget {
//   const ProductCatalog({super.key});
//
//   @override
//   State<ProductCatalog> createState() => _ProductCatalogState();
// }
//
// class _ProductCatalogState extends State<ProductCatalog> {
//   final _debouncer = Debouncer(milliseconds: 500);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         UISearchField(
//           fieldWidth: double.infinity,
//           hint: 'Search',
//           icon: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Assets.icons.search.svg(),
//           ),
//           onChanged: (value) => _debouncer.run(
//             (() {
//               context.read<PosProductSearchCubit>().setSearchKey(value);
//               context.read<ProductCatalogCubit>().getProductCatalog(
//                     search: value,
//                     isInitialSearch: true,
//                   );
//             }),
//           ),
//         ),
//         const UIVerticalSpace(36),
//         BlocBuilder<ProductCatalogCubit, ProductCatalogState>(
//           builder: (context, state) {
//             if (state is ProductCatalogLoaded) {
//               return Expanded(child: ProductCatalogDataGrid(state.products));
//             }
//
//             if (state is ProductCatalogFailure) {
//               return Text(state.message);
//             }
//
//             if (state is ProductCatalogLoading) {
//               return DataGridLoading(
//                 columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
//                 source: ProductCatalogDataSource([], context),
//               );
//             }
//
//             return DataGridNoData(
//               columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
//               source: ProductCatalogDataSource([], context),
//             );
//           },
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _debouncer.dispose();
//     super.dispose();
//   }
// }
