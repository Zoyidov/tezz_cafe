import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
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
    final width = context.width * 0.9 / max(1, clientTabBloc.state.isSelected.length);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: AppColors.toggleSelectedColor, borderRadius: BorderRadius.circular(8)),
      height: 40,
      child: ToggleButtons(
        constraints: BoxConstraints(maxWidth: width, minWidth: width, minHeight: width, maxHeight: width),
        isSelected: context.watch<ClientTabBloc>().state.isSelected,
        onPressed: (int index) => clientTabBloc.add(TabChanged(index: index)),
        children: clientTabBloc.tabs.map((e) => Text(e)).toList(),
      ),
    );
  }
}

class ClientsPageView extends StatelessWidget {
  const ClientsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final clientTabBloc = context.read<ClientTabBloc>();

    return PageView.builder(
      itemCount: 3,
      controller: clientTabBloc.pageController,
      onPageChanged: (value) => clientTabBloc.add(PageChanged(index: value)),
      itemBuilder: (context, index) {
        return const ClientsListView();
      },
    );
  }
}

class ClientsListView extends StatelessWidget {
  const ClientsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return const ClientListItem();
      },
      separatorBuilder: (context, index) => const Gap(12),
      itemCount: 10,
    );
  }
}

class ClientListItem extends StatelessWidget {
  const ClientListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.textFieldColor,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClientIcon(isActive: false),
        ],
      ),
    );
  }
}

class ClientIcon extends StatelessWidget {
  const ClientIcon({super.key, this.isActive = true});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleIcon(isActive: isActive),
        const Gap(8),
        Text(
          'Stol-1',
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

class ClientDetails extends StatelessWidget {
  const ClientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '12:00',
      style: context.bodySmall?.copyWith(color: AppColors.grey400),
    );
  }
}

class ClientListItemActive extends StatelessWidget {
  const ClientListItemActive({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteNames.place);
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClientIcon(),
                ClientDetails(),
              ],
            ),
            const Gap(20),
            Text(
              "234 000 so’m",
              textAlign: TextAlign.right,
              style: context.titleMedium?.copyWith(color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
