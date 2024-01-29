import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shashliklar'),
        actions: const [PlaceActionWidget()],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 20,
          childAspectRatio: 162 / 232,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(RouteNames.foodDetail);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 168,
                  width: 162,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    AppImages.food1,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(12),
                Text(
                  "G’ijduvon shashlik",
                  style: context.titleMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    fontSize: 18,
                  ),
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '356 000 uzs',
                      style: AppFontStyle.description2.copyWith(color: AppColors.red),
                    ),
                    Text(
                      '546 000 uzs',
                      style: context.labelSmall?.copyWith(
                        color: AppColors.black400,
                        height: 1.6,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
