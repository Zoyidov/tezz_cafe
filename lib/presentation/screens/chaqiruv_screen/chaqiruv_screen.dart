import 'package:flutter/material.dart';
import 'package:tezz_cafe/presentation/screens/chaqiruv_screen/recieved.dart';
import 'package:tezz_cafe/presentation/widgets/notification_container.dart';

class ChaqiruvScreen extends StatefulWidget {
  const ChaqiruvScreen({Key? key}) : super(key: key);

  @override
  _ChaqiruvScreenState createState() => _ChaqiruvScreenState();
}

class _ChaqiruvScreenState extends State<ChaqiruvScreen> {
  List<bool> showRecievedContainers = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          "Bosh sahifa",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final stolNumber = index + 1;
          return showRecievedContainers[index]
              ? RecievedContainer(
            type: 'Chaqiruv',
            place: 'STOL-$stolNumber',
            status: 'Boryapman',
            onTap: () {
              setState(() {
                showRecievedContainers[index] = !showRecievedContainers[index];
              });
            },
          )
              : NotificationContainer(
            type: 'Chaqiruv',
            place: 'STOL-$stolNumber',
            time: '12:34',
            status: 'Boryapman',
            onTap: () {
              setState(() {
                showRecievedContainers[index] = !showRecievedContainers[index];
              });
            },
          );
        },
      ),
    );
  }
}
