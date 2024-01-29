import 'package:flutter/material.dart';
import 'package:tezz_cafe/utils/colors/colors.dart';
import 'package:gap/gap.dart';

class BuyurtmaDetailScreen extends StatelessWidget {
  const BuyurtmaDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stol-1",
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text("1234567 so'm"),
          )
        ],
      ),
      body: Column(
        children: [
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chaqiruv /12:00",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
                "hjfh",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "jhvjh",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const Gap(20),
              Container(
                decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                padding: const EdgeInsets.all(20),
                child: const Icon(
                  Icons.notifications_active_rounded,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
          const Divider(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: (){},
            child: const Center(
                child: Text(
                  "hgfjhg",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
          )
        ],
      ),
    )
        ],
      ),
    );
  }
}
