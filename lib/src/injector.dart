
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kortoba_flutter_task/src/data/data_sources/local/local_data_source.dart';
import 'package:kortoba_flutter_task/src/data/repositories/products_repository_impl.dart';
import 'package:kortoba_flutter_task/src/domain/repositories/auth_repository.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/home/bloc/products_cubit.dart';
import 'data/data_sources/preferences/preferences_storage.dart';
import 'data/data_sources/remote/api_services.dart';
import 'data/data_sources/remote/dio_clinte.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/products_repository.dart';
import 'presentation/screens/login/bloc/login_cubit.dart';
import 'presentation/screens/main/favorites/bloc/favorite_products_cubit.dart';



final locator = GetIt.instance;

Future<void> injectDependencies() async {

  //Data Sources Initialization
  locator.registerSingleton<Dio>(DioClient().create());
  locator.registerSingleton<ApiService>(ApiService(locator()));
  locator.registerSingleton<PreferencesStorage>(PreferencesStorage());
  locator.registerSingleton<LocalDataSource>(LocalDataSource.instance);

  //Repositories Initialization
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator(),locator()));
  locator.registerSingleton<ProductsRepository>(ProductsRepositoryImpl(locator(),locator()));


  //Blocs Initialization
  locator.registerFactory<LoginCubit>(() => LoginCubit(locator()));
  locator.registerFactory<ProductsCubit>(() => ProductsCubit(locator()));
  locator.registerFactory<FavoriteProductsCubit>(() => FavoriteProductsCubit(locator()));

}
