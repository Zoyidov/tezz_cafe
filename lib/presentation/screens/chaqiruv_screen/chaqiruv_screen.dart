import 'package:flutter/material.dart';
import 'package:tezz_cafe/presentation/widgets/notification_container.dart';

class ChaqiruvScreen extends StatelessWidget {
  const ChaqiruvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bosh sahifa", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
      ),
      body: Column(
        children: [
          NotificationContainer()
        ],
      ),
    );
  }
}
