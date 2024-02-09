import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/feature/clients/data/data_sources/table_data_source.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/orders/presentation/manager/order_bloc.dart';
import 'package:tezz_cafe/feature/waitress/presentation/manager/waitress_bloc.dart';
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
            // print(context.read<ClientTabBloc>().state.updateStatus);
            // print(context.read<ClientTabBloc>().state.failure);
            // print(StorageRepository.getString(StorageKeys.cafeId));
            // context.read<ClientTabBloc>().add(GetTablesByCafe(StorageRepository.getString(StorageKeys.cafeId)));
            // print(context.read<ClientTabBloc>().state.tables);
            final token = StorageRepository.getString(StorageKeys.token);
            final response = await TableDataSourceImpl().loginCode(
                tableId: "65c3e9ca7ce4b3f89d31a2d4",
                waiterToken:
                    token,
                cafeId: '65c3e5c47ce4b3f89d31a263',
                code: '1234');
            print(response);
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
