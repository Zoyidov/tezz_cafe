import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/message_no_active.dart';
import 'package:tezz_cafe/feature/navigation/presentation/manager/tab_cubit.dart';
import 'package:tezz_cafe/presentation/screens/chaqiruv_screen/chaqiruv_screen.dart';
import 'package:tezz_cafe/feature/clients/presentation/pages/mijojzlar_screen.dart';
import 'package:tezz_cafe/presentation/screens/yangi_buyurtma_screen/yangi_buyurtma_screen.dart';
import 'package:tezz_cafe/utils/icons/icons.dart';
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
      extendBody: false,
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return IndexedStack(
            index: context.watch<TabCubit>().state.index,
            children: [
              const ChaqiruvScreen(),
              const YangiBuyurtmaScreen(),
              state.isActive ? MessageNoActive() : ClientsScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabCubit>().state.index,
        onTap: context.read<TabCubit>().changeTab,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.Schaqiruv),
            icon: SvgPicture.asset(AppIcons.chaqiruv),
            label: "Chaqiruv",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.Sbuyurtma),
            icon: SvgPicture.asset(AppIcons.buyurtma),
            label: "Yangi Buyurtma",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.Smijozlar),
            icon: SvgPicture.asset(AppIcons.mijozlar),
            label: "Mijozlar",
          ),
        ],
      ),
    );
  }
}
