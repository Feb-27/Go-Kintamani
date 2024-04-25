import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/HotelList.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: HotelList.length,
          itemBuilder: ((context, index) {
            Hotel HotelScreen = HotelList[index];
            return Card(
              child: ListTile(
                title: Text(HotelScreen.title),
                leading: Image.network(HotelScreen.imageurl),
                trailing: Icon(Icons.arrow_forward_rounded),
              ),
            );
          })),
    );
  }
}
