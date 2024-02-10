import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tezz_cafe/business_logic/menu/menu_bloc.dart';
import 'package:tezz_cafe/business_logic/order_item/order_item_bloc.dart';
import 'package:tezz_cafe/business_logic/zone/zone_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/core/utils/formatters/currency_formatter.dart';
import 'package:tezz_cafe/data/order_item/models/order_item_model.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/mijojzlar_screen.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key, required this.table});

  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(table.number),
        actions: [
          BlocBuilder<OrderItemBloc, OrderItemState>(
            builder: (context, state) {
              if (state.status.isInProgress) {
                return Skeletonizer(
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(currencyFormat.format(state.totalPrice), style: AppFontStyle.description2)),
                );
              }
              return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(currencyFormat.format(state.totalPrice), style: AppFontStyle.description2));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MenuBloc>().add(GetMenuItems(
              context.read<ZoneBloc>().state.zone.firstWhere((element) => element.id == table.zone).cafe.toString()));
          context.pushNamed(RouteNames.menu);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<OrderItemBloc, OrderItemState>(
        builder: (context, state) {
          if (state.status.isInProgress) {
            return Skeletonizer(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const OrderItem(order: OrderItemModel());
                },
                separatorBuilder: (context, index) => const Gap(16),
                itemCount: 10,
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final order = state.orderItems[index];
                    return OrderItem(order: order);
                  },
                  separatorBuilder: (context, index) => const Gap(16),
                  itemCount: state.orderItems.length,
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
          );
        },
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final OrderItemModel order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.textFieldColor,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: BorderDirectional(bottom: BorderSide(color: AppColors.grey100)),
            ),
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
                      '/ ${formatDate(order.createdAt?? DateTime.now(), [HH, ':', nn])}',
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
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      order.product ?? '',
                      style: AppFontStyle.description2.copyWith(fontWeight: FontWeight.w600, color: AppColors.black),
                    ),
                    const Gap(8),
                    Text(
                      currencyFormat.format(order.productOriginalPrice ?? 0),
                      style: AppFontStyle.mIn12.copyWith(color: AppColors.grey400),
                    ),
                    const Gap(4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${order.quantity} ta :',
                          style: AppFontStyle.description2
                              .copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                        ),
                        Text(currencyFormat.format(double.parse(order.price ?? "0")),
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
  }
}
