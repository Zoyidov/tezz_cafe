import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/common/shimmer_skeleton/shimmer_skeleton.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/core/utils/formatters/currency_formatter.dart';
import 'package:tezz_cafe/feature/menu/data/models/menu_model.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';
import 'package:tezz_cafe/feature/product/presentation/manager/product_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.menuModel});

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuModel.title),
        actions: const [PlaceActionWidget()],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status.isInProgress) {
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 162 / 232,
              ),
              itemCount: state.products.isEmpty ? 8 : state.products.length,
              // Display 4 skeletons when products are empty
              itemBuilder: (context, index) {
                return const ShimmerProductCard();
              },
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
                  context.pushNamed(RouteNames.foodDetail,arguments: product);
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
                      product.title,
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

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SkeletonLoader(height: 170, width: double.infinity, radius: 12),
          Gap(12),
          SkeletonLoader(height: 18, width: double.infinity, radius: 4),
          Gap(8),
          SkeletonLoader(height: 18, width: double.infinity * 0.1, radius: 4),
          // Container(
          //   height: 18,
          //   color: Colors.white, // Set the background color for the shimmer
          // ),
        ],
      ),
    );
  }
}
