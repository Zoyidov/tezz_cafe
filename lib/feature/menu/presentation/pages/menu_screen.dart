import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: const [PlaceActionWidget()],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.pushNamed(RouteNames.category),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: 168,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(AppImages.food, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Osh',
                    style: context.headlineSmall
                        ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w600, height: 1.25),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Gap(16),
        itemCount: 10,
      ),
    );
  }
}
