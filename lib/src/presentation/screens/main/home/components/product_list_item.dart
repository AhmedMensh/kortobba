import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortoba_flutter_task/generated/l10n.dart';
import 'package:kortoba_flutter_task/src/config/size_config/size_config.dart';
import 'package:kortoba_flutter_task/src/core/colors.dart';
import 'package:kortoba_flutter_task/src/domain/entities/product.dart';
import 'package:kortoba_flutter_task/src/presentation/screens/main/favorites/bloc/favorite_products_cubit.dart';
import 'package:kortoba_flutter_task/src/presentation/widgets/network_image_widget.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({required this.product, Key? key}) : super(key: key);

  final Product? product;

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  late FavoriteProductsCubit _favoriteProductsCubit;

  @override
  void initState() {
    _favoriteProductsCubit = BlocProvider.of<FavoriteProductsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      // padding: const EdgeInsets.symmetric(horizontal: 4),
      width: SizeConfig.screenWidth! * .4,
      child: Stack(
        children: [
          Column(
            children: [
              NetworkImageWidget(
                widget.product?.imageLink,
                width: SizeConfig.screenWidth! * .4,
                height: SizeConfig.screenHeight! * .2,
                fit: BoxFit.fill,
              ),
              Text('${widget.product?.description}',
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: kBLUE_700, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${widget.product?.price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: kBLUE_700,
                                    fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' ${S().l_e}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: kBLUE_700)),
                      ],
                    ),
                  ),
                  const Icon(Icons.add_shopping_cart_outlined),
                ],
              )
            ],
          ),
          Positioned(
              top: 10,
              right: 5,
              child: GestureDetector(
                  onTap: () {
                    _favoriteProductsCubit.addToFavorite(widget.product);
                  },
                  child: const Icon(
                    Icons.favorite_outline_rounded,
                  ))),
        ],
      ),
    );
  }
}
