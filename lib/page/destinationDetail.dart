import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/DestinationsList.dart';

class MyDetail extends StatelessWidget {
  final Destination destination;

  MyDetail(this.destination);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(destination.imageurl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                destination.location,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                destination.descriptions,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
