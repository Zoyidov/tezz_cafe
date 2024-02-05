import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/core/utils/constants/image_strings.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/message_no_active.dart';
import 'package:tezz_cafe/feature/navigation/presentation/manager/tab_cubit.dart';
import 'package:tezz_cafe/presentation/screens/chaqiruv_screen/chaqiruv_screen.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/mijojzlar_screen.dart';
import 'package:tezz_cafe/presentation/screens/yangi_buyurtma_screen/yangi_buyurtma_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  TabBoxState createState() => TabBoxState();
}

class TabBoxState extends State<TabBox> {
  List<Widget> pages = [
    const ChaqiruvScreen(),
    const YangiBuyurtmaScreen(),
    const ClientsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return IndexedStack(
            index: context.watch<TabCubit>().state.index,
            children: [
              const ChaqiruvScreen(),
              const YangiBuyurtmaScreen(),
              state.isActive ? const MessageNoActive() : const ClientsScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabCubit>().state.index,
        onTap: context.read<TabCubit>().changeTab,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.Schaqiruv),
            icon: SvgPicture.asset(AppImages.chaqiruv),
            label: "Chaqiruv",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.Sbuyurtma),
            icon: SvgPicture.asset(AppImages.buyurtma),
            label: "Yangi Buyurtma",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.clientsFill),
            icon: SvgPicture.asset(AppImages.clients),
            label: "Mijozlar",
          ),
        ],
      ),
    );
  }
}
