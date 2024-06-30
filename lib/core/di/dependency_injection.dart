import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/sidebar_cubit.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/dio_service.dart';
import 'package:medglobal_admin_portal/features/authentication/data/api/auth_api.dart';
import 'package:medglobal_admin_portal/features/authentication/data/api/auth_service.dart';
import 'package:medglobal_admin_portal/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/repositories/auth_repository.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/confirm_first_time_login.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/login.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/usecases/logout.dart';
import 'package:medglobal_admin_portal/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/features/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/features/product_management/data/repositories/category_repository_impl.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/repositories/category_repository.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/category/add_category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/category/get_all_categories.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/bloc/category/category_bloc.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/bloc/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/data/api/supplier_api.dart';
import 'package:medglobal_admin_portal/features/supplier_management/data/repositories/supplier_repository_impl.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/create_supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/delete_supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_supplier_by_id.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_suppliers.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/update_supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/bloc/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/bloc/supplier_list/supplier_list_cubit.dart';

/// lazySingleton are only initialized when needed while factory are always initialized

GetIt injector = GetIt.instance;

void initDependencyInjection() {
  injector

    /// Dio
    ..registerSingleton<DioService>(DioService())

    /// API Service
    ..registerSingleton<ApiService>(ApiService(injector()))
    ..registerSingleton<AuthService>(AuthService())

    /// Datasource
    ..registerLazySingleton<AuthApi>(() => AuthApiImpl(injector()))
    ..registerLazySingleton<SupplierApi>(() => SupplierApiImpl(injector()))
    ..registerLazySingleton<CategoryApi>(() => CategoryApiImpl(injector()))

    /// Repository
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(injector()))
    ..registerLazySingleton<SupplierRepository>(() => SupplierRepositoryImpl(injector()))
    ..registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(injector()))

    /// Usecases
    /// Authentication UseCase
    ..registerLazySingleton(() => Login(injector()))
    ..registerLazySingleton(() => ConfirmFirstTimeLogin(injector()))
    ..registerLazySingleton(() => GetAuthSession(injector()))
    ..registerLazySingleton(() => Logout(injector()))

    /// Supplier UseCase
    ..registerLazySingleton(() => GetSuppliers(injector()))
    ..registerLazySingleton(() => GetSupplierById(injector()))
    ..registerLazySingleton(() => CreateSupplier(injector()))
    ..registerLazySingleton(() => UpdateSupplier(injector()))
    ..registerLazySingleton(() => DeleteSupplier(injector()))

    /// Products UseCase
    ..registerLazySingleton(() => AddCategoryUseCase(injector()))
    ..registerLazySingleton(() => GetCategoriesUseCase(injector()))

    /// Bloc
    ..registerFactory(() => AuthBloc(injector(), injector(), injector(), injector()))
    ..registerFactory(() => SidebarCubit())
    ..registerFactory(() => SupplierListCubit(injector()))
    ..registerFactory(() => SupplierCubit(injector(), injector(), injector(), injector()))
    ..registerFactory(() => ProductSelectionCubit())
    ..registerFactory(() => CategoryBloc(injector(), injector()));
}
