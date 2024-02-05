import 'package:flutter/material.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/presentation/screens/yangi_buyurtma_screen/order_container.dart';

class BuyurtmaDetailScreen extends StatelessWidget {
  final int stolNumber;
  const BuyurtmaDetailScreen({super.key, required this.stolNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Stol-$stolNumber",
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text("1234567 so'm"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => OrderContainer(
                  time: "/12:00",
                  foodName: "G'ijduvon shashlik Ajoyib shashlik",
                  price: "56 000 uzs",
                  count: "3 ta : ",
                  countPrice: "168 000 uzs",
                  image: "https://source.unsplash.com/800x533/?food",
                  onTap: () {},
                ),
                itemCount: 5,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20,bottom: 25),
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
