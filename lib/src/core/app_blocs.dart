import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortoba_flutter_task/src/injector.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/login/bloc/login_cubit.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/favorites/bloc/favorite_products_cubit.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/home/bloc/products_cubit.dart';

List<BlocProvider> getAppBlocs() {
  return [
    BlocProvider<LoginCubit>(create: (context) => locator()),
    BlocProvider<ProductsCubit>(create: (context) => locator()),
    BlocProvider<FavoriteProductsCubit>(create: (context) => locator()),
  ];
}
