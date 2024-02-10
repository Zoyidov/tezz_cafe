import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/business_logic/order/order_bloc.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/constants/font_style.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';
import 'package:tezz_cafe/presentation/screens/yangi_buyurtma_screen/order_container.dart';

class BuyurtmaDetailScreen extends StatelessWidget {
  final int stolNumber;

  const BuyurtmaDetailScreen({super.key, required this.stolNumber, required this.table});

  final TableModel table;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          table.number,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text("20 000 uzs", style: AppFontStyle.description2),
          )
        ],
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      return OrderContainer(
                          time: formatDate(order.createdAt, [HH, ':', nn,]),
                          foodName: "Kartoshka",
                          price: "${order.totalPrice} uzs",
                          count: "3 ta : ",
                          countPrice: "${order.totalPrice} uzs",
                          image: "https://source.unsplash.com/800x533/?food",
                          onTap: () {},
                        );},
                    itemCount: state.orders.length,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: const Center(
            child: Text(
              "Buyurtma berish",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
