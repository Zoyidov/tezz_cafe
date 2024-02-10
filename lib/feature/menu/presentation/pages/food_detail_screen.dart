import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/business_logic/menu/menu_bloc.dart';
import 'package:tezz_cafe/business_logic/product/product_bloc.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/core/utils/formatters/currency_formatter.dart';
import 'package:tezz_cafe/data/product/models/product_model.dart';
import 'package:tezz_cafe/feature/menu/presentation/widgets/place_actions_widget.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(product.name),
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
                  child: Image.network(product.image,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.name,
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
                          uzbekCurrencyFormat.format(product.price),
                          style: AppFontStyle.description2.copyWith(color: AppColors.red),
                        ),
                        // const Gap(14),
                        // Text(
                        //   '546 000 uzs',
                        //   style: context.labelSmall?.copyWith(
                        //     color: AppColors.black400,
                        //     height: 1.6,
                        //     decoration: TextDecoration.lineThrough,
                        //     fontSize: 10,
                        //   ),
                        // ),
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
                      'Tarif:',
                      style: context.titleMedium?.copyWith(color: AppColors.grey500, fontWeight: FontWeight.w600),
                    ),
                    const Gap(4),
                    Text(
                      product.description,
                      style: AppFontStyle.description.copyWith(color: AppColors.grey500),
                    )
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: 6,
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       leading: Text(index.toString()),
                    //       title: const Text('Qo’y go’shti, yirik holda to’g’lalgan'),
                    //     );
                    //   },
                    // )
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            // top: state.isVisible ? 0 : 100,
            opacity: state.isVisible ? 1 : 0,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton.filledTonal(
                  onPressed: () {
                    context.read<ProductBloc>().add(ProductDecrement());
                  },
                  icon: const Icon(Icons.remove),
                  style: iconButtonStyle),
              const Gap(12),
              Text(
                state.count.toString(),
                style: context.titleMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                  fontSize: 20,
                ),
              ),
              const Gap(12),
              IconButton.filledTonal(
                  onPressed: () {
                    context.read<ProductBloc>().add(ProductIncrement());
                  },
                  icon: const Icon(Icons.add),
                  style: iconButtonStyle),
            ]),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FilledButton(
              onPressed: () {},
              child: Text(currencyFormat.format(product.price * state.count), style: AppFontStyle.description2),
            ),
          ),
        );
      },
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
