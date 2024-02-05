
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/mijojzlar_screen.dart';
import 'package:tezz_cafe/feature/navigation/presentation/manager/tab_cubit.dart';

class MessageNoActive extends StatefulWidget {
  const MessageNoActive({super.key});

  @override
  State<MessageNoActive> createState() => _MessageNoActiveState();
}

class _MessageNoActiveState extends State<MessageNoActive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<TabCubit>().changeMessageState(false);
          },
          child: const Icon(Icons.arrow_back)),
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
    return BlocBuilder<ClientTabBloc, ClientTabState>(
      builder: (context, state) {
        if (state.zoneStatus.isInProgress) {
          return const Skeletonizer(child: ZoneShimmerWidget());
        } else if (state.zones.isEmpty && state.zoneStatus.isSuccess) {
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
              isSelected: context.watch<ClientTabBloc>().state.isSelectedNoActive,
              onPressed: (int index) => clientTabBloc.add(TabChangedNoActive(index: index)),
              children: state.zones.map((e) => Text(e.title)).toList(),
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
    final clientTabBloc = context.read<ClientTabBloc>();

    return BlocBuilder<ClientTabBloc, ClientTabState>(
      builder: (context, state) {
        print(state.noActiveClientTabIndex);
        if (state.tableStatus.isInProgress) {
          return const CircularProgressIndicator();
        }
        if (state.tables.isEmpty && state.tableStatus.isSuccess) {
          return const Text('Stollar mavjud emas');
        }
        return PageView.builder(
          itemCount: clientTabBloc.state.zones.length,
          controller: clientTabBloc.pageControllerNoActive,
          onPageChanged: (value) => clientTabBloc.add(PageChangedNoActive(index: value)),
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
    return BlocBuilder<ClientTabBloc, ClientTabState>(
      builder: (context, state) {
        final List<TableModel> filteredTables =
            state.tables.where((element) => state.zones[index].id == element.zoneId && !element.active).toList();
        if (filteredTables.isEmpty) {
          return Center(
            child: Text('Faol bo`lmagan stollar topilmadi',style: context.titleLarge,textAlign: TextAlign.center,),
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.textFieldColor,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClientIcon(isActive: table.active, table: table),
        ],
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
          table.stolNomi,
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

// class ClientDetails extends StatelessWidget {
//   const ClientDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '12:00',
//       style: context.bodySmall?.copyWith(color: AppColors.grey400),
//     );
//   }
// }



