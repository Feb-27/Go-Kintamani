import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/FoodList.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: FoodList.length,
          itemBuilder: ((context, index) {
            Food FoodScreen = FoodList[index];
            return Card(
              child: ListTile(
                title: Text(FoodScreen.title),
                leading: Image.network(FoodScreen.imageurl),
                trailing: Icon(Icons.arrow_forward_rounded),
              ),
            );
          })),
    );
  }
}
