import 'package:get_it/get_it.dart';
import 'package:wasity_captin/feature/auth/data/datasource/remote/auth_remote.dart';
import 'package:wasity_captin/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:wasity_captin/feature/auth/domain/repository/auth_respository.dart';
import 'package:wasity_captin/feature/auth/domain/usecase/signin_usecase.dart';
import 'package:wasity_captin/feature/auth/domain/usecase/verify_code_usecase.dart';
import 'package:wasity_captin/feature/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:wasity_captin/feature/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:wasity_captin/feature/delivered_orders/data/datasource/remote/delivered_orders_remote.dart';
import 'package:wasity_captin/feature/delivered_orders/data/repository/delivered_orders_repository_impl.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/repository/delivered_orders_repository.dart';
import 'package:wasity_captin/feature/delivered_orders/domain/usecase/delivered_orders_usecase.dart';
import 'package:wasity_captin/feature/delivered_orders/presentation/cubit/signin_cubit/delivered_orders_cubit.dart';
import 'package:wasity_captin/feature/delivered_orders/presentation/screen/delivered_orders_screen.dart';
import 'package:wasity_captin/feature/main/data/datasource/remote/main_home_remote.dart';
import 'package:wasity_captin/feature/main/domain/repository/main_home_repository.dart';
import 'package:wasity_captin/feature/main/domain/usecase/get_orders_usecase.dart';
import 'package:wasity_captin/feature/main/domain/usecase/take_order_usecase.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/get_orders_cubit/signin_cubit.dart';
import 'package:wasity_captin/feature/main/presentation/cubit/take_order_cubit/take_order_cubit.dart';
import 'package:wasity_captin/feature/profile/data/datasource/remote/profile_remote.dart';
import 'package:wasity_captin/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:wasity_captin/feature/profile/domain/repository/profile_respository.dart';
import 'package:wasity_captin/feature/profile/domain/usecase/update_profile_usecase.dart';
import 'package:wasity_captin/feature/profile/presentation/cubit/get_profile_cubit/get_profile_cubit.dart';
import 'package:wasity_captin/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';

import '../../feature/main/data/datasource/repository/main_home_repository_impl.dart';
import '../../feature/profile/domain/usecase/get_profile_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => SigninCubit(usecase: sl()));
  sl.registerFactory(() => VerifyCodeCubit(usecase: sl()));
  sl.registerLazySingleton(() => SigninUseCase(repository: sl()));
  sl.registerLazySingleton(() => VerifyCodeUseCase(repository: sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());

  sl.registerFactory(() => GetProfileCubit(usecase: sl()));
  sl.registerFactory(() => UpdateProfileCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(repository: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<ProfileRemote>(() => ProfileRemoteImpl());

  sl.registerFactory(() => DeliveredOrdersCubit(usecase: sl()));
  sl.registerLazySingleton(() => DeliveredOrdersUseCase(repository: sl()));
  sl.registerLazySingleton<DeliveredOrdersRepository>(
      () => DeliveredOrdersRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<DeliveredOrdersRemote>(
      () => DeliveredOrdersRemoteImpl());

  sl.registerFactory(() => GetOrdersCubit(usecase: sl()));
  sl.registerFactory(() => TakeOrderCubit(usecase: sl()));
  sl.registerLazySingleton(() => GetOrdersUsecase(repository: sl()));
  sl.registerLazySingleton(() => TakeOrderUsecase(repository: sl()));
  sl.registerLazySingleton<MainHomeRepository>(
      () => MainHomeRepositoryImpl(remote: sl()));
  sl.registerLazySingleton<MainHomeRemote>(() => MainHomeRemoteImpl());
}
