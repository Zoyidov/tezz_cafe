import 'package:flutter/material.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/utils/colors/colors.dart';
import 'package:gap/gap.dart';

class NotificationContainer extends StatelessWidget {
  final String type;
  final String place;
  final String time;
  final String status;
  final VoidCallback? onTap;

  const NotificationContainer({super.key, required this.type, required this.place, required this.time, required this.status, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Text(
               time,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                place,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
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
            onPressed: onTap,
            child: Center(
                child: Text(
              status,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
