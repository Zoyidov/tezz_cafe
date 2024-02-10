import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tezz_cafe/business_logic/order_item/order_item_bloc.dart';
import 'package:tezz_cafe/business_logic/table/table_bloc.dart';
import 'package:tezz_cafe/business_logic/zone/zone_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/formatters/currency_formatter.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';
import 'package:tezz_cafe/feature/navigation/presentation/manager/tab_cubit.dart';
import 'package:date_format/date_format.dart';
import '../../../../business_logic/order/order_bloc.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context.pushNamed(RouteNames.menu);
            context.read<TabCubit>().changeMessageState(true);
          },
          child: const Icon(Icons.add)),
      appBar: const ClientsAppBar(),
      body: const ClientsPageView(),
    );
  }
}

class ClientsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ClientsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const ToggleButtonsContainer(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ToggleButtonsContainer extends StatelessWidget {
  const ToggleButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // final clientTabBloc = context.read<ClientTabBloc>();

    // final width = context.width * 0.9 / max(1, clientTabBloc.state.isSelected.length);
    return BlocBuilder<ZoneBloc, ZoneState>(
      builder: (context, state) {
        print(state.status);
        if (state.status.isInProgress) {
          return const Skeletonizer(child: ZoneShimmerWidget());
        } else if (state.zone.isEmpty && state.status.isSuccess) {
          return const Text('Zonalar mavjud emas');
        }

        return Container(
          height: 40,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              constraints: BoxConstraints(
                  maxWidth: context.width * 0.3, minWidth: context.width * 0.3, minHeight: 36, maxHeight: 36),
              isSelected: state.activeZone,
              onPressed: (index) => context.read<ZoneBloc>().add(SelectActiveZoneEvent(index)),
              children: state.zone.map((e) => Text(e.name)).toList(),
            ),
          ),
        );
      },
    );
  }
}

class ZoneShimmerWidget extends StatelessWidget {
  const ZoneShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mockValues = [false, false, false];
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: ToggleButtons(
          borderRadius: BorderRadius.circular(10),
          constraints: BoxConstraints(
              maxWidth: context.width * 0.3, minWidth: context.width * 0.3, minHeight: 36, maxHeight: 36),
          isSelected: mockValues,
          children: mockValues.map((e) => const Text('Teressa')).toList(),
        ),
      ),
    );
  }
}

class ClientsPageView extends StatelessWidget {
  const ClientsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        if (state.status.isInProgress) {
          return Skeletonizer(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return const ClientListItemActive(
                    table: TableModel(id: 1, number: 'number', capacity: 1, active: true, totalPrice: 0, zone: 1));
              },
              separatorBuilder: (context, index) => const Gap(12),
              itemCount: 10,
            ),
          );
        }

        return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.table?.length ?? 0,
          controller: context.read<ZoneBloc>().activePageController,
          // onPageChanged: (value) => clientTabBloc.add(PageChanged(index: value)),
          itemBuilder: (context, index) {
            return ClientsListView(index: index);
          },
        );
      },
    );
  }
}

class ClientsListView extends StatelessWidget {
  const ClientsListView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final zoneBloc = context.read<ZoneBloc>();
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        final List<TableModel> filteredTables =
            state.table?.where((element) => zoneBloc.state.zone[index].id == element.zone && element.active).toList() ??
                [];
        if (filteredTables.isEmpty) {
          return Center(child: Text('Stollar topilmadi', style: context.titleLarge, textAlign: TextAlign.center));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            final table = filteredTables[index];
            return ClientListItemActive(table: table);
          },
          separatorBuilder: (context, index) => const Gap(12),
          itemCount: filteredTables.length,
        );
      },
    );
  }
}

class ClientIcon extends StatelessWidget {
  const ClientIcon({super.key, this.isActive = true, required this.table});

  final bool isActive;
  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIcon(isActive: isActive),
        const Gap(8),
        Text(
          table.number,
          style: context.headlineSmall?.copyWith(color: AppColors.black, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: ShapeDecoration(shape: const CircleBorder(), color: isActive ? AppColors.green : AppColors.red),
    );
  }
}

class ClientListItemActive extends StatelessWidget {
  const ClientListItemActive({super.key, required this.table});

  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final orderId = context.read<OrderBloc>().state.orders?.firstWhere((element) => element.table == table.id).id;
        context.read<OrderItemBloc>().add(FetchOrderItemsEvent(orderId.toString()));
        context.pushNamed(RouteNames.place, arguments: table);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.textFieldColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClientIcon(table: table),
                Text(
                  context.read<OrderBloc>().state.orders!.isNotEmpty &&
                          (context.read<OrderBloc>().state.orders?.map((e) => e.table)??[]).contains(table.id)??false
                      ? formatDate(
                          context
                                      .watch<OrderBloc>()
                                      .state
                                      .orders
                                      ?.where((element) => element.table == table.id)
                                      .isNotEmpty ??
                                  false
                              ? context
                                  .watch<OrderBloc>()
                                  .state
                                  .orders
                                  ?.where((element) => element.table == table.id)
                                  .elementAt(0)
                                  .createdAt ?? DateTime.now()
                              : DateTime.now(),
                          [HH, ':', nn])
                      : '-',
                  style: context.bodySmall?.copyWith(color: AppColors.grey400),
                ),
              ],
            ),
            const Gap(20),
            Text(
              currencyFormat.format(table.totalPrice),
              textAlign: TextAlign.right,
              style: context.titleMedium?.copyWith(color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
