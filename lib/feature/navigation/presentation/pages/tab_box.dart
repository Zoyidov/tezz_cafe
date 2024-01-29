import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: IndexedStack(
        index: context.watch<TabCubit>().state,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<TabCubit>().state,
        onTap: context.read<TabCubit>().changeTab,
        items: [
          BottomNavigationBarItem(
            icon: context.watch<TabCubit>().state == 0 ? SvgPicture.asset(AppIcons.Schaqiruv) : SvgPicture.asset(AppIcons.chaqiruv),
            label: "Chaqiruv",
          ),
          BottomNavigationBarItem(
            icon: context.watch<TabCubit>().state == 1 ? SvgPicture.asset(AppIcons.Sbuyurtma) : SvgPicture.asset(AppIcons.buyurtma),
            label: "Yangi Buyurtma",
          ),
          BottomNavigationBarItem(
            icon: context.watch<TabCubit>().state == 2 ? SvgPicture.asset(AppIcons.Smijozlar) : SvgPicture.asset(AppIcons.mijozlar),
            label: "Mijozlar",
          ),
        ]
      )
    );
  }
}
