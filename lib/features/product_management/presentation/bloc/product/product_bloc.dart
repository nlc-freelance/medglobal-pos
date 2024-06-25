import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const InitialProductState()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
