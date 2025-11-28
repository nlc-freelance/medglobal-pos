import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/repositories/sales_per_shift_repository.dart';

class GetSalesPerShiftByIdUseCase implements UseCase<SalesPerShiftDetails, GetSalesPerShiftByIdParams> {
  final SalesPerShiftRepository repository;

  const GetSalesPerShiftByIdUseCase(this.repository);

  @override
  Future<ApiResult<SalesPerShiftDetails>> call(GetSalesPerShiftByIdParams params) =>
      repository.getSalesPerShiftById(params.id);
}

class GetSalesPerShiftByIdParams {
  final int id;

  GetSalesPerShiftByIdParams(this.id);
}
