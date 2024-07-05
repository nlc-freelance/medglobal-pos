part of 'product_form_cubit.dart';

class ProductFormState extends Equatable {
  const ProductFormState(this.product);

  final Product? product;

  @override
  List<Object?> get props => [product];

  factory ProductFormState.initial() => const ProductFormState(null);
}



// class ProductFormState extends Equatable {
//   const ProductFormState({
//     this.name,
//     this.imageUrl,
//     this.category,
//     this.suppliers,
//     this.sku,
//     this.warningStockLevel,
//     this.idealStockLevel,
//     this.branches,
//     this.price,
//     this.qtyOnHand,
//   });

//   final String? name;
//   final String? imageUrl;
//   final Category? category;
//   final List<Supplier>? suppliers;
//   final String? sku;
//   final int? warningStockLevel;
//   final int? idealStockLevel;
//   final List<Branch>? branches;
//   final double? price;
//   final int? qtyOnHand;

//   @override
//   List<Object?> get props => [name, category, imageUrl];

//   factory ProductFormState.initial() => const ProductFormState();

//   ProductFormState copyWith({
//     String? name,
//     String? imageUrl,
//     Category? category,
//     List<Supplier>? suppliers,
//     String? sku,
//     int? warningStockLevel,
//     int? idealStockLevel,
//     List<Branch>? branches,
//     double? price,
//     int? qtyOnHand,
//   }) {
//     return ProductFormState(
//       name: name ?? this.name,
//       imageUrl: imageUrl ?? this.imageUrl,
//       category: category ?? this.category,
//       suppliers: suppliers ?? this.suppliers,
//       sku: sku ?? this.sku,
//       warningStockLevel: warningStockLevel ?? this.warningStockLevel,
//       idealStockLevel: idealStockLevel ?? this.idealStockLevel,
//       branches: branches ?? this.branches,
//       price: price ?? this.price,
//       qtyOnHand: qtyOnHand ?? this.qtyOnHand,
//     );
//   }
// }
