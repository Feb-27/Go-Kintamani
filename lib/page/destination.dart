import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/DestinationsList.dart';
import 'package:flutter_application_1/page/destinationDetail.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: DestinationList.length,
          itemBuilder: ((context, index) {
            Destination destination = DestinationList[index];
            return Card(
              child: ListTile(
                title: Text(destination.title),
                leading: Image.network(destination.imageurl),
                trailing: Icon(Icons.arrow_forward_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyDetail(destination)));
                },
              ),
            );
          })),
    );
  }
}
