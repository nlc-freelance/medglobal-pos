import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/http_client/http_client.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_api.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_service.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/repositories/auth_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/confirm_first_time_login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/logout.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/api/employee_api.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/repositories/employee_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/repository/register_repository_impl.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/app_session/data/datasources/app_session_datasource.dart';
import 'package:medglobal_admin_portal/pos/app_session/data/repositories/session_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/repository/app_session_repository.dart';
import 'package:medglobal_admin_portal/pos/authentication/blocs/session/session_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/data/datasources/remote_receipt_config_datasource.dart';
import 'package:medglobal_admin_portal/pos/device_setup/data/repositories/settings/local_settings_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/device_setup/data/repositories/receipt_config/remote_receipt_config_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/settings/local_settings_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/receipt_config/remote_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/usecases/bind_device_usecase.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/usecases/check_device_setting_usecase.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/unassigned_registers/unassigned_register_list_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/local_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/remote_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/repositories/local_product_catalog_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/repositories/remote_product_catalog_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/local_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/remote_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/delta_sync_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/get_product_catalog_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/initial_fetch_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_remote/product_catalog_bloc.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/cubit/product_catalog_local/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/data/datasources/local_sale_datasource.dart';
import 'package:medglobal_admin_portal/pos/register/data/datasources/sale_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/register/data/repositories/local_sale_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/register/data/repositories/remote_sale_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/local_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/create_sale_usecase.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/print_receipt_usecase.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/sale/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_local_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/repositories/local_register_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/repositories/remote_register_shift_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/remote_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/check_for_open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/close_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/get_last_closed_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/sync_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/write_sync_bloc/write_sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/read_sync_bloc/read_sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync_queue/sync_queue_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/refund/local_refund_datasource.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/refund/remote_refund_datasource.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/transactions/transaction_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/repositories/refund/local_refund_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/repositories/refund/remote_refund_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/repositories/transactions/remote_transaction_repository_impl.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund/local_refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund/remote_refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transactions/register_transaction_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/usecases/issue_refund_usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/refund_bloc/refund_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/register_transaction_bloc/register_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/transaction_list_bloc/transaction_list_bloc.dart';

GetIt inject = GetIt.instance;

void initPosDependencies() {
  coreDependencies();
  authDependencies();
  databaseDependencies();
  connectivityDependencies();
  sessionDependencies();
  deviceSetupDependencies();
  syncDependencies();
  registerDependencies();
  registerShiftDependencies();
  receiptConfigDependencies();
  productCatalogDependencies();
  saleDependencies();
  transactionDependencies();
  refundDependencies();
}

void coreDependencies() {
  inject
    // ..registerSingleton<DioService>(DioService()) // old
    // ..registerSingleton<ApiService>(ApiService(inject())) // old
    ..registerSingleton(HttpClient())
    ..registerSingleton(ApiService(inject<HttpClient>()));
}

void authDependencies() {
  inject
    ..registerSingleton<AuthService>(AuthService())
    ..registerLazySingleton<AuthApi>(() => AuthApiImpl(inject()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(inject()))
    ..registerLazySingleton(() => Login(inject()))
    ..registerLazySingleton(() => ConfirmFirstTimeLogin(inject()))
    ..registerLazySingleton(() => GetAuthSession(inject()))
    ..registerLazySingleton(() => Logout(inject()))
    ..registerFactory(
      () => AuthBloc(
        inject<Login>(),
        inject<ConfirmFirstTimeLogin>(),
        inject<GetAuthSession>(),
        inject<Logout>(),
      ),
    );
}

void databaseDependencies() => inject.registerSingleton<AppDatabase>(AppDatabase());

void connectivityDependencies() {
  inject
    ..registerSingleton<ConnectivityService>(ConnectivityService())
    ..registerFactory<ConnectivityCubit>(
      () => ConnectivityCubit(service: inject<ConnectivityService>()),
    );
}

void sessionDependencies() {
  inject
    ..registerLazySingleton<AppSessionService>(() => AppSessionService())
    ..registerLazySingleton<AppSessionDataSource>(
      () => AppSessionDataSource(dao: inject<AppDatabase>().sessionDao),
    )
    ..registerLazySingleton<AppSessionRepository>(
      () => AppSessionRepositoryImpl(localDataSource: inject<AppSessionDataSource>()),
    )
    ..registerFactory<SessionBloc>(
      () => SessionBloc(
        sessionRepository: inject<AppSessionRepository>(),
        getAuthSession: inject<GetAuthSession>(),
        connectivityService: inject<ConnectivityService>(),
      ),
    );
}

void deviceSetupDependencies() {
  inject
    ..registerLazySingleton<EmployeeApi>(
      () => EmployeeApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(api: inject<EmployeeApi>()),
    )
    ..registerLazySingleton<LocalSettingsRepository>(
      () => LocalSettingsRepositoryImpl(dao: inject<AppDatabase>().settingsDao),
    )
    ..registerLazySingleton<CheckDeviceSettingUseCase>(
      () => CheckDeviceSettingUseCase(
        localSettingsRepository: inject<LocalSettingsRepository>(),
      ),
    )
    ..registerLazySingleton<BindDeviceUseCase>(
      () => BindDeviceUseCase(
        registerRepository: inject<RegisterRepository>(),
        remoteReceiptConfigRepository: inject<RemoteReceiptConfigRepository>(),
        localSettingsRepository: inject<LocalSettingsRepository>(),
      ),
    )
    ..registerFactory<DeviceSetupBloc>(
      () => DeviceSetupBloc(
        bindDeviceUseCase: inject<BindDeviceUseCase>(),
        checkDeviceSettingUseCase: inject<CheckDeviceSettingUseCase>(),
      ),
    );
}

void syncDependencies() {
  inject
    ..registerLazySingleton<SyncQueueRepository>(
      () => SyncQueueRepository(
        dao: inject<AppDatabase>().syncQueueDao,
        session: inject<AppSessionService>(),
      ),
    )
    ..registerLazySingleton<SyncService>(
      () => SyncService(
        session: inject<AppSessionService>(),
        syncQueueRepository: inject<SyncQueueRepository>(),
        receiptConfigRemoteRepo: inject<RemoteReceiptConfigRepository>(),
        registerShiftRemoteRepo: inject<RemoteRegisterShiftRepository>(),
        saleRemoteRepo: inject<RemoteSaleRepository>(),
      ),
    )
    ..registerFactory<ReadSyncBloc>(
      () => ReadSyncBloc(
        syncService: inject<SyncService>(),
        connection: inject<ConnectivityService>(),
      ),
    )
    ..registerFactory<WriteSyncBloc>(
      () => WriteSyncBloc(
        syncService: inject<SyncService>(),
        connection: inject<ConnectivityService>(),
      ),
    );
}

void registerDependencies() {
  inject
    ..registerLazySingleton<RegisterApiService>(
      () => RegisterApiService(api: inject<ApiService>()),
    )
    ..registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(api: inject<RegisterApiService>()),
    )
    ..registerFactory<UnassignedRegisterListCubit>(
      () => UnassignedRegisterListCubit(
        registerRepository: inject<RegisterRepository>(),
      ),
    );
}

void registerShiftDependencies() {
  inject
    ..registerLazySingleton<RegisterShiftLocalDataSource>(
      () => RegisterShiftLocalDataSource(dao: inject<AppDatabase>().registerShiftDao),
    )
    ..registerLazySingleton<RegisterShiftRemoteDataSource>(
      () => RegisterShiftRemoteDataSource(api: inject<ApiService>()),
    )
    ..registerLazySingleton<LocalRegisterShiftRepository>(
      () => LocalRegisterShiftRepositoryImpl(dataSource: inject<RegisterShiftLocalDataSource>()),
    )
    ..registerLazySingleton<RemoteRegisterShiftRepository>(
      () => RemoteRegisterShiftRepositoryImpl(dataSource: inject<RegisterShiftRemoteDataSource>()),
    )
    ..registerLazySingleton<OpenRegisterShiftUseCase>(
      () => OpenRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        remote: inject<RemoteRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
        connection: inject<ConnectivityService>(),
        sync: inject<SyncQueueRepository>(),
      ),
    )
    ..registerLazySingleton<CheckForOpenRegisterShiftUseCase>(
      () => CheckForOpenRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
      ),
    )
    ..registerLazySingleton<GetLastClosedRegisterShiftUseCase>(
      () => GetLastClosedRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
      ),
    )
    ..registerLazySingleton<CloseRegisterShiftUseCase>(
      () => CloseRegisterShiftUseCase(
        local: inject<LocalRegisterShiftRepository>(),
        remote: inject<RemoteRegisterShiftRepository>(),
        session: inject<AppSessionService>(),
        connection: inject<ConnectivityService>(),
        sync: inject<SyncQueueRepository>(),
      ),
    )
    ..registerFactory<RegisterShiftBloc>(
      () => RegisterShiftBloc(
        openRegisterShiftUseCase: inject<OpenRegisterShiftUseCase>(),
        checkForOpenRegisterShiftUseCase: inject<CheckForOpenRegisterShiftUseCase>(),
        getLastClosedRegisterShiftUseCase: inject<GetLastClosedRegisterShiftUseCase>(),
        closeRegisterShiftUseCase: inject<CloseRegisterShiftUseCase>(),
      ),
    );
}

void receiptConfigDependencies() {
  inject
    ..registerLazySingleton<RemoteReceiptConfigDataSource>(
      () => RemoteReceiptConfigDataSource(inject<ApiService>()),
    )
    ..registerLazySingleton<RemoteReceiptConfigRepository>(
      () => RemoteReceiptConfigRepositoryImpl(remoteDataSource: inject<RemoteReceiptConfigDataSource>()),
    )
    ..registerLazySingleton<PrintReceiptUseCase>(
      () => PrintReceiptUseCase(
        remoteReceiptConfigRepository: inject<RemoteReceiptConfigRepository>(),
        appSessionService: inject<AppSessionService>(),
        connection: inject<ConnectivityService>(),
      ),
    )
    ..registerFactory<PrintReceiptCubit>(
      () => PrintReceiptCubit(printReceiptUseCase: inject<PrintReceiptUseCase>()),
    );
}

void productCatalogDependencies() {
  inject
    ..registerLazySingleton<LocalProductCatalogDataSource>(
      () => LocalProductCatalogDataSource(dao: inject<AppDatabase>().productCatalogDao),
    )
    ..registerLazySingleton<RemoteProductCatalogDataSource>(
      () => RemoteProductCatalogDataSource(api: inject<ApiService>()),
    )
    ..registerLazySingleton<LocalProductCatalogRepository>(
      () => LocalProductCatalogRepositoryImpl(localDataSource: inject<LocalProductCatalogDataSource>()),
    )
    ..registerLazySingleton<RemoteProductCatalogRepository>(
      () => RemoteProductCatalogRepositoryImpl(remoteDataSource: inject<RemoteProductCatalogDataSource>()),
    )
    ..registerLazySingleton<InitialFetchProductsUseCase>(
      () => InitialFetchProductsUseCase(
        local: inject<LocalProductCatalogRepository>(),
        remote: inject<RemoteProductCatalogRepository>(),
        session: inject<AppSessionService>(),
        syncMetaDataDao: inject<AppDatabase>().syncMetadataDao,
      ),
    )
    ..registerLazySingleton<DeltaSyncProductsUseCase>(
      () => DeltaSyncProductsUseCase(
        local: inject<LocalProductCatalogRepository>(),
        remote: inject<RemoteProductCatalogRepository>(),
        session: inject<AppSessionService>(),
        syncMetaDataDao: inject<AppDatabase>().syncMetadataDao,
      ),
    )
    ..registerLazySingleton<GetProductCatalogUseCase>(
      () => GetProductCatalogUseCase(local: inject<LocalProductCatalogRepository>()),
    )
    ..registerFactory<ProductCatalogCubit>(
      () => ProductCatalogCubit(getProductCatalogUseCase: inject<GetProductCatalogUseCase>()),
    );
}

void saleDependencies() {
  inject
    ..registerLazySingleton<LocalSaleDataSource>(
      () => LocalSaleDataSource(dao: inject<AppDatabase>().transactionDao),
    )
    ..registerLazySingleton<RemoteSaleDataSource>(
      () => RemoteSaleDataSource(api: inject<ApiService>()),
    )
    ..registerLazySingleton<LocalSaleRepository>(
      () => LocalSaleRepositoryImpl(localDataSource: inject<LocalSaleDataSource>()),
    )
    ..registerLazySingleton<RemoteSaleRepository>(
      () => RemoteSaleRepositoryImpl(remoteDataSource: inject<RemoteSaleDataSource>()),
    )
    ..registerLazySingleton<CreateSaleUseCase>(
      () => CreateSaleUseCase(
        localRegisterShiftRepository: inject<LocalRegisterShiftRepository>(),
        local: inject<LocalSaleRepository>(),
        remote: inject<RemoteSaleRepository>(),
        sync: inject<SyncQueueRepository>(),
        connection: inject<ConnectivityService>(),
        appSessionService: inject<AppSessionService>(),
      ),
    )
    ..registerFactory<SaleBloc>(
      () => SaleBloc(
        createSaleUseCase: inject<CreateSaleUseCase>(),
      ),
    );
}

void transactionDependencies() {
  inject
    ..registerLazySingleton<TransactionApi>(
      () => TransactionApi(api: inject<ApiService>()),
    )
    ..registerLazySingleton<TransactionRepository>(
      () => TransactionRepositoryImpl(api: inject<TransactionApi>()),
    )
    ..registerLazySingleton<RegisterTransactionRepository>(
      () => RemoteTransactionRepositoryImpl(api: inject<TransactionApi>()),
    )
    ..registerFactory<TransactionListBloc>(
      () => TransactionListBloc(inject<TransactionRepository>()),
    )
    ..registerFactory<RegisterTransactionBloc>(
      () => RegisterTransactionBloc(inject<RegisterTransactionRepository>()),
    );
}

void refundDependencies() {
  inject
    ..registerLazySingleton<LocalRefundDataSource>(
      () => LocalRefundDataSource(dao: inject<AppDatabase>().transactionDao),
    )
    ..registerLazySingleton<RemoteRefundDataSource>(
      () => RemoteRefundDataSource(api: inject<ApiService>()),
    )
    ..registerLazySingleton<RemoteRefundRepository>(
      () => RemoteRefundRepositoryImpl(remoteDataSource: inject<RemoteRefundDataSource>()),
    )
    ..registerLazySingleton<LocalRefundRepository>(
      () => LocalRefundRepositoryImpl(localDataSource: inject<LocalRefundDataSource>()),
    )
    ..registerLazySingleton<IssueRefundUseCase>(
      () => IssueRefundUseCase(
        localRegisterShiftRepository: inject<LocalRegisterShiftRepository>(),
        local: inject<LocalRefundRepository>(),
        remote: inject<RemoteRefundRepository>(),
        syncQueue: inject<SyncQueueRepository>(),
        connection: inject<ConnectivityService>(),
        appContext: inject<AppSessionService>(),
      ),
    )
    ..registerFactory<RefundBloc>(
      () => RefundBloc(issueRefundUseCase: inject<IssueRefundUseCase>()),
    );
}
