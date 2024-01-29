import 'package:flutter/material.dart';
import 'package:tezz_cafe/utils/colors/colors.dart';
import 'package:gap/gap.dart';

class RecievedContainer extends StatelessWidget {
  final String type;
  final String place;
  final String status;
  final VoidCallback? onTap;

  const RecievedContainer({super.key, required this.type, required this.place, required this.status, this.onTap});

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
              IconButton(onPressed: onTap, icon: const Icon(Icons.clear))
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
                  color: AppColors.green,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
