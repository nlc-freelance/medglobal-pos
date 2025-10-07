import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

class RemoteReceiptConfigDataSource {
  final ApiService _api;

  RemoteReceiptConfigDataSource(this._api);

  Future<ReceiptConfiguration?> getReceiptConfigByBranch(int id, int? lastSynced) async {
    final data = await _api.get<ReceiptConfiguration?>(
      ApiEndpoints.receiptConfigByBranchId(id),
      queryParams: lastSynced == null ? null : {'lastSynced': lastSynced},
      parser: (json) => parse(json, ReceiptConfiguration.fromJson),
    );

    return data;
  }
}
