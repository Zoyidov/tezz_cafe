import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/business_logic/order/order_bloc.dart';
import 'package:tezz_cafe/business_logic/table/table_bloc.dart';
import 'package:tezz_cafe/business_logic/zone/zone_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/presentation/screens/yangi_buyurtma_screen/buyurtma_detail_screen.dart';
import 'package:tezz_cafe/presentation/widgets/notification_container.dart';

class YangiBuyurtmaScreen extends StatelessWidget {
  const YangiBuyurtmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: 's',
          onPressed: () async {
            // context.read<ZoneBloc>().add(FetchZoneByCafeIdEvent('1'));
            // context.read<TableBloc>().add(GetTablesByCafeEvent('1'));
            // context.read<OrderBloc>().add(FetchOrdersByCafeIdEvent('1', '1'));
            print(context.read<OrderBloc>().state.orders);

          }),
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          final stolNumber = index + 1;
          return NotificationContainer(
            type: 'Yangi buyurtma',
            place: 'STOL-$stolNumber',
            time: '12:34',
            status: 'Ko\'rish',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyurtmaDetailScreen(stolNumber: stolNumber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
