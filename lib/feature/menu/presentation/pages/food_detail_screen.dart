import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/feature/menu/presentation/manager/menu_bloc.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('G’ijduvon shashlik'),
        actions: const [PlaceActionWidget()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        controller: context.read<MenuBloc>().scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: 336,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                AppImages.food1,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'G’ijduvon shashlik',
                  style: context.titleMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    fontSize: 20,
                  ),
                ),
                const Gap(12),
                Row(
                  children: [
                    Text(
                      '36 000 uzs',
                      style: AppFontStyle.description2.copyWith(color: AppColors.red),
                    ),
                    const Gap(14),
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
                ),
              ],
            ),
            const Gap(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(),
                const Gap(12),
                Text(
                  'Tarkibi:',
                  style: context.titleMedium?.copyWith(color: AppColors.grey500, fontWeight: FontWeight.w600),
                ),
                const Gap(4),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(index.toString()),
                      title: const Text('Qo’y go’shti, yirik holda to’g’lalgan'),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            // top: state.isVisible ? 0 : 100,
            opacity: state.isVisible ? 1 : 0,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.remove), style: iconButtonStyle),
              const Gap(12),
              Text(
                '2',
                style: context.titleMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                  fontSize: 20,
                ),
              ),
              const Gap(12),
              IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.add), style: iconButtonStyle),
            ]),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FilledButton(
          onPressed: () {},
          child: const Text('72 000 so’m'),
        ),
      ),
    );
  }
}

final iconButtonStyle = IconButton.styleFrom(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.primaryColor,
    minimumSize: const Size.square(44),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ));
