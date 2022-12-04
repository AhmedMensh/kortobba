import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortoba_flutter_task/generated/l10n.dart';
import 'package:kortoba_flutter_task/src/config/size_config/size_config.dart';
import 'package:kortoba_flutter_task/src/core/colors.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/home/bloc/products_cubit.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/custom_progress.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/snack_bar.dart';

import 'components/product_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductsCubit _productsCubit;

  @override
  void initState() {
    super.initState();
    _productsCubit = BlocProvider.of<ProductsCubit>(context);
    _productsCubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOFF_WHITE,
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: Colors.black,),
        title: Text(
          S().home,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (_, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CustomProgress(),
            );
          }
          if (state is ProductsError) {
            return Center(
              child: Text('${state.error}'),
            );
          }
          if (state is ProductsEmpty) {
            return  Center(
              child: Text(S().no_data_available),
            );
          }
          if (state is ProductsSuccess) {
            return SizedBox(
              height: SizeConfig.screenHeight! * .35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Text(S().recently_arrived,style: Theme.of(context).textTheme.headline6,)),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.products?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductListItem(
                          product: state.products![index],
                        );
                      }),
                ),
              ],)
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
