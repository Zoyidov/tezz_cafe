import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tezz_cafe/business_logic/product/product_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/core/utils/formatters/currency_formatter.dart';
import 'package:tezz_cafe/data/menu/models/menu_model.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.menuModel});

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuModel.name),
        actions: const [PlaceActionWidget()],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status.isInProgress) {
            // return GridView.builder(
            //   padding: const EdgeInsets.all(12),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 12,
            //     mainAxisSpacing: 20,
            //     childAspectRatio: 162 / 232,
            //   ),
            //   itemCount: state.products.isEmpty ? 8 : state.products.length,
            //   // Display 4 skeletons when products are empty
            //   itemBuilder: (context, index) {
            //     return const ShimmerProductCard();
            //   },
            // );
            return Skeletonizer(
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 20,
                  childAspectRatio: 162 / 232,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  // final product = state.products[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(AppImages.food,
                            fit: BoxFit.cover,
                            height: 170,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                                  AppImages.imageNotFound,
                                  fit: BoxFit.cover,
                                  height: 170,
                                  width: double.infinity,
                                )),
                      ),
                      const Gap(12),
                      Text(
                        'Tovuq shashlik',
                        style: context.titleMedium?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        '356 000 uzs',
                        style: AppFontStyle.description2.copyWith(color: AppColors.red),
                      )
                    ],
                  );
                },
              ),
            );
          }
          if (state.status.isFailure) {
            return Center(
                child: Text(
              state.error,
              style: context.titleMedium,
              textAlign: TextAlign.center,
            ));
          }
          if (state.products.isEmpty) {
            return Center(
                child: Text(
              'Taomlar mavjud emas.',
              style: context.headlineSmall?.copyWith(color: AppColors.grey500),
              textAlign: TextAlign.center,
            ));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
              childAspectRatio: 162 / 232,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return GestureDetector(
                onTap: () {
                  context.read<ProductBloc>().add(SetProductCount());
                  context.pushNamed(RouteNames.foodDetail, arguments: product);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      child: Image.network("${ApiConstants.baseUrl}/${product.image}",
                          fit: BoxFit.cover,
                          height: 170,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                AppImages.imageNotFound,
                                fit: BoxFit.cover,
                                height: 170,
                                width: double.infinity,
                              )),
                    ),
                    const Gap(12),
                    Text(
                      product.name,
                      style: context.titleMedium?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                        fontSize: 18,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      uzbekCurrencyFormat.format(product.price),
                      // '356 000 uzs',
                      style: AppFontStyle.description2.copyWith(color: AppColors.red),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
