import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class UpdateStockTakeItemsByIdUseCase implements UseCase<void, UpdateStockTakeItemsByIdParams> {
  final StockTakeRepository _repository;

  UpdateStockTakeItemsByIdUseCase(this._repository);

  @override
  Future<ApiResult<void>> call(UpdateStockTakeItemsByIdParams params) =>
      _repository.updateStockItemsById(id: params.id, items: params.items);
}

class UpdateStockTakeItemsByIdParams {
  final int id;
  final Map<int, int?> items;

  UpdateStockTakeItemsByIdParams({required this.id, required this.items});
}
