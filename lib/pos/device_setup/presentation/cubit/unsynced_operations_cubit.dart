import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync_queue/sync_queue_repository.dart';

class UnsyncedOperationsCubit extends Cubit<int> {
  UnsyncedOperationsCubit() : super(0);

  void getUnsyncedOperations() async {
    final pendingItemsByUser = await GetIt.I<SyncQueueRepository>().getPendingItemsByUser();
    final pendingItemsByUserCount = pendingItemsByUser.length;

    emit(pendingItemsByUserCount);
  }
}
