import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/mijojzlar_screen.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stol-1'),
        actions: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('1 234 000 so’m', style: AppFontStyle.description2),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteNames.menu);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.listTileBackgroundColor
                          // border: Border.all()
                          ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: AppColors.grey100))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleIcon(isActive: true),
                                const Gap(8),
                                const Text('Chaqiruv', style: AppFontStyle.description),
                                const Gap(8),
                                Text(
                                  '/ 12:00',
                                  style: context.bodySmall?.copyWith(color: AppColors.grey400),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.clear), color: AppColors.grey500),
                          ],
                        ),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          Container(
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                AppImages.food1,
                                fit: BoxFit.cover,
                              )),
                          const Gap(12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'G’ijduvon shashlik Ajoyib shashlik',
                                  style: AppFontStyle.description2
                                      .copyWith(fontWeight: FontWeight.w600, color: AppColors.black),
                                ),
                                const Gap(8),
                                Text(
                                  '56 000 uzs',
                                  style: AppFontStyle.mIn12.copyWith(color: AppColors.grey400),
                                ),
                                const Gap(4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '3 ta :',
                                      style: AppFontStyle.description2
                                          .copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                                    ),
                                    Text('168 000 uzs',
                                        style: AppFontStyle.description2
                                            .copyWith(fontWeight: FontWeight.w600, color: AppColors.grey500)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: 5,
            ),
            const Gap(24),
            SizedBox(
              width: context.width / 2,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.red,
                ),
                child: const Text("Stolni yopish"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
