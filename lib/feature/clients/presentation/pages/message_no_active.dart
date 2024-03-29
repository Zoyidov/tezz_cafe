import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tezz_cafe/business_logic/table/table_bloc.dart';
import 'package:tezz_cafe/business_logic/zone/zone_bloc.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/mijojzlar_screen.dart';
import 'package:tezz_cafe/feature/navigation/presentation/manager/tab_cubit.dart';
import 'package:toastification/toastification.dart';

class MessageNoActive extends StatefulWidget {
  const MessageNoActive({super.key});

  @override
  State<MessageNoActive> createState() => _MessageNoActiveState();
}

class _MessageNoActiveState extends State<MessageNoActive> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ClientTabBloc, ClientTabState>(
      listener: (context, state) {
        // if (state.updateStatus.isFailure) {
        //   toastification.show(
        //     context: context,
        //     type: ToastificationType.error,
        //     style: ToastificationStyle.fillColored,
        //     title: const Text('Xatolik'),
        //     autoCloseDuration: const Duration(seconds: 5),
        //     alignment: Alignment.bottomCenter,
        //     description: Text(state.failure),
        //   );
        // } else if (state.updateStatus.isSuccess) {
        //   context.read<ClientTabBloc>().add(GetTablesByCafe(StorageRepository.getString(StorageKeys.cafeId)));
        // }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<TabCubit>().changeMessageState(false);
            },
            child: const Icon(Icons.arrow_back)),
        appBar: const ClientsAppBar(),
        body: const ClientsPageView(),
      ),
    );
  }
}

class ClientsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ClientsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<ClientTabBloc, ClientTabState>(
        builder: (context, state) {
          return const ToggleButtonsContainer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ToggleButtonsContainer extends StatelessWidget {
  const ToggleButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final clientTabBloc = context.read<ClientTabBloc>();

    // final width = context.width * 0.9 / max(1, clientTabBloc.state.isSelected.length);
    return BlocBuilder<ZoneBloc, ZoneState>(
      builder: (context, state) {
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
              isSelected: state.noActiveZone,
              onPressed: (index) => context.read<ZoneBloc>().add(SelectNoActiveZoneEvent(index)),
              children: state.zone.map((e) => Text(e.name)).toList(),
            ),
          ),
        );
      },
    );
  }
}

class ClientsPageView extends StatelessWidget {
  const ClientsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final zoneBloc = context.read<ZoneBloc>();
    return BlocBuilder<TableBloc, TableState>(
      builder: (context, state) {
        if (state.status.isInProgress) {
          return Skeletonizer(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                // final table = filteredTables[index];
                return const ClientListItem(
                    table: TableModel(id: 1, number: "number", capacity: 1, active: true, totalPrice: 0, zone: 1));
              },
              separatorBuilder: (context, index) => const Gap(12),
              itemCount: 10,
            ),
          );
        }
        // if (state.tables.isEmpty && state.tableStatus.isSuccess) {
        //   return const Center(child: Text('Stollar mavjud emas'));
        // }
        return PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: zoneBloc.state.zone.length,
          controller: zoneBloc.noActivePageController,
          // onPageChanged: (value) => clientTabBloc.add(PageChangedNoActive(index: value)),
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
            state.table?.where((element) => zoneBloc.state.zone[index].id == element.zone && !element.active).toList()?? [];
        if (filteredTables.isEmpty) {
          return Center(
            child: Text(
              'Faol bo`lmagan stollar topilmadi',
              style: context.titleLarge,
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            final table = filteredTables[index];
            return ClientListItem(table: table);
          },
          separatorBuilder: (context, index) => const Gap(12),
          itemCount: filteredTables.length,
        );
      },
    );
  }
}

class ClientListItem extends StatelessWidget {
  const ClientListItem({super.key, required this.table});

  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   showDialog(
      //     context: context,
      //     builder: (context) {
      //       final TextEditingController codeController = TextEditingController();
      //       return AlertDialog(
      //         backgroundColor: AppColors.containerColor,
      //         surfaceTintColor: AppColors.containerColor,
      //         title: Text(table.number),
      //         content: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             Text('Tasdiqlash kodini kiriting', style: context.titleMedium?.copyWith(color: AppColors.black)),
      //             const Gap(12),
      //             TextFormField(
      //               controller: codeController,
      //               decoration: const InputDecoration(hintText: '1234'),
      //               maxLength: 4,
      //               keyboardType: TextInputType.number,
      //               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      //               autovalidateMode: AutovalidateMode.onUserInteraction,
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return 'Tasdiqlash kodini kiriting';
      //                 }
      //                 if (value.length != 4) {
      //                   return 'Tasdiqlash kodini to\'ldiring (4 ta raqam)';
      //                 }
      //                 return null;
      //               },
      //             ),
      //             const Gap(12),
      //             FilledButton(onPressed: () {}, child: const Text('Tasdiqlash')),
      //           ],
      //         ),
      //       );
      //     },
      //   );
      // },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.textFieldColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClientIcon(isActive: table.active, table: table),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.table_bar, color: table.active ? AppColors.green : AppColors.red),
                const Gap(8),
                Text(table.capacity.toString(), style: context.titleMedium?.copyWith(color: AppColors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClientIcon extends StatelessWidget {
  const ClientIcon({super.key, this.isActive = true, required this.table});

  final TableModel table;
  final bool isActive;

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
