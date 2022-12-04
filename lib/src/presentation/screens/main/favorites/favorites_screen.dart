import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortoba_flutter_task/generated/l10n.dart';
import 'package:kortoba_flutter_task/src/config/size_config/size_config.dart';
import 'package:kortoba_flutter_task/src/core/colors.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/favorites/bloc/favorite_products_cubit.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/custome_elevated_button.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/network_image_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavoriteProductsCubit _favoriteProductsCubit;

  @override
  void initState() {
    _favoriteProductsCubit = BlocProvider.of<FavoriteProductsCubit>(context);
    _favoriteProductsCubit.getFavoriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOFF_WHITE,
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: Colors.black,),
        title: Text(
          S().favorites,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 15,),

        ],
      ),
      body: BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
        builder: (_, state) {
          if (state is FavoriteProductsEmpty) {
            return Center(
              child: Text(S().favorites_list_empty),
            );
          }
          if (state is FavoriteProductsSuccess) {
            return SizedBox(
              height: double.infinity,
              child: ListView.builder(
                  itemCount: state.products?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: SizeConfig.screenWidth! * .4,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    topLeft: Radius.circular(6)),
                                child: NetworkImageWidget(
                                  state.products?[index].imageLink,
                                  width: double.infinity,
                                  height: SizeConfig.screenHeight! * .3,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Text(
                                  '${state.products?[index].description}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Text(
                                      '${state.products?[index].price}   ${S().l_e}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: kBLUE_700,
                                              fontWeight: FontWeight.bold))),
                              CustomRoundedButton(
                                action: () {},
                                label: S().add_to_cart,
                                bottomLeftBorderRadius: 6,
                                bottomRightBorderRadius: 6,
                              )
                            ],
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                  onTap: () {
                                    _favoriteProductsCubit
                                        .removeProductFromFavoriteByProductId(
                                            state.products?[index].id ?? -1);
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: kPINK_500,
                                  ))),
                        ],
                      ),
                    );
                  }),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
