import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/business_logic/order/order_bloc.dart';
import 'package:tezz_cafe/business_logic/table/table_bloc.dart';
import 'package:tezz_cafe/business_logic/zone/zone_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';
import 'package:tezz_cafe/presentation/screens/yangi_buyurtma_screen/buyurtma_detail_screen.dart';
import 'package:tezz_cafe/presentation/widgets/notification_container.dart';

class YangiBuyurtmaScreen extends StatelessWidget {
  const YangiBuyurtmaScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     heroTag: 's',
      //     onPressed: () async {
      //       // context.read<ZoneBloc>().add(FetchZoneByCafeIdEvent('1'));
      //       // context.read<TableBloc>().add(GetTablesByCafeEvent('1'));
      //       // context.read<OrderBloc>().add(FetchOrdersByCafeIdEvent('1', '1'));
      //       print(context
      //           .read<OrderBloc>()
      //           .state
      //           .orders);
      //     }),
      appBar: AppBar(
        // scrolledUnderElevation: 0,
        title: const Text("Faol Buyurtma"),
        actions: [
          IconButton(
              onPressed: () {
                StorageRepository.deleteBool(StorageKeys.isAuth);
                StorageRepository.deleteString(StorageKeys.token);
                Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          final List<TableModel> filteredTables = state.table
              .where((element) => element.active)
              .toList();
          if (filteredTables.isEmpty) {
            return Center(child: Text('Buyurtmalar mavjud emas', style: context.titleLarge, textAlign: TextAlign.center));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: filteredTables.length,
            itemBuilder: (context, index) {
              final stolNumber = index ;
              return NotificationContainer(
                type: 'Yangi buyurtma',
                place: state.table[index].number,
                time: context.read<OrderBloc>().state.orders.isNotEmpty &&
                    context.read<OrderBloc>().state.orders.map((e) => e.table).contains(state.table[index].id)
                    ? formatDate(
                    context
                        .watch<OrderBloc>()
                        .state
                        .orders
                        .where((element) => element.table == state.table[index].id)
                        .first
                        .createdAt,
                    [HH, ':', nn])
                    : '--:--',
                status: 'Ko\'rish',
                onTap: () {
                  context.read<ZoneBloc>().add(FetchZoneByCafeIdEvent(state.table[index].zone.toString()));
                  context.read<TableBloc>().add(GetTablesByCafeEvent(state.table[index].zone.toString()));
                  context
                      .read<OrderBloc>()
                      .add(FetchOrdersByCafeIdEvent(state.table[index].zone.toString(), state.table[index].id.toString()));
                  context.push(BuyurtmaDetailScreen(stolNumber: stolNumber, table: state.table[index]));
                },
              );
            },
          );
        },
      ),
    );
  }
}
