import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/common/shimmer_skeleton/shimmer_skeleton.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/feature/menu/presentation/manager/menu_bloc.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';
import 'package:tezz_cafe/feature/product/presentation/manager/product_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: const [PlaceActionWidget()],
      ),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state.status.isInProgress) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                if (state.menuItems.isEmpty) {
                  return const SkeletonLoader(height: 170, width: double.infinity);
                }
              },
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: state.menuItems.isEmpty ? 5 : state.menuItems.length,
            );
          }
          if (state.status.isFailure) {
            return Center(child: Text(state.error, style: context.bodyMedium?.copyWith()));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final menuItem = state.menuItems[index];
              return GestureDetector(
                onTap: () {
                  context.pushNamed(RouteNames.category,arguments: menuItem);
                  context.read<ProductBloc>().add(GetProductByMenuId(menuItem.id));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Image.network(
                        "${ApiConstants.baseUrl}/${menuItem.image}",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 170,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            AppImages.imageNotFound,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 170,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        menuItem.title,
                        style: context.headlineSmall
                            ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w600, height: 1.25),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: state.menuItems.length,
          );
        },
      ),
    );
  }
}


