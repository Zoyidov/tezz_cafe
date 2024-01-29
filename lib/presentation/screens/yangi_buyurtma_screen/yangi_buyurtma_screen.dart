import 'package:flutter/material.dart';
import 'package:tezz_cafe/presentation/screens/yangi_buyurtma_screen/buyurtma_detail_screen.dart';
import 'package:tezz_cafe/presentation/widgets/notification_container.dart';

class YangiBuyurtmaScreen extends StatelessWidget {
  const YangiBuyurtmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Faol Buyurtma",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          NotificationContainer(
            type: 'Chaqiruv',
            place: 'STOL-1',
            time: '12:34',
            status: 'Ko\'rish',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BuyurtmaDetailScreen()));
            },
          )
        ],
      ),
    );
  }
}
