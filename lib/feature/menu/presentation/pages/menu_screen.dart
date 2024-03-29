import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tezz_cafe/business_logic/menu/menu_bloc.dart';
import 'package:tezz_cafe/business_logic/product/product_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';
import 'package:blurhash_ffi/blurhash_ffi.dart';

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
            return Skeletonizer(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          AppImages.food1,
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
                          "menuItem.title",
                          style: context.headlineSmall
                              ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w600, height: 1.25),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Gap(16),
                itemCount: 10,
              ),
            );
          }
          if (state.status.isFailure) {
            return Center(child: Text(state.message, style: context.bodyMedium?.copyWith()));
          }
          if (state.menuItems.isEmpty) {
            return Center(
              child: Text(
                'Menya mavjud emas.',
                style: context.headlineSmall?.copyWith(color: AppColors.grey500),
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final menuItem = state.menuItems[index];
              final blurhash = BlurhashFFI.encode(NetworkImage(menuItem.image));
              return GestureDetector(
                onTap: () {
                  context.pushNamed(RouteNames.category, arguments: menuItem);
                  context.read<ProductBloc>().add(GetProductByMenuId(menuItem.id.toString()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Image.network(
                        menuItem.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        cacheHeight: 1080,
                        cacheWidth: 1920,
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
                        menuItem.name,
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
