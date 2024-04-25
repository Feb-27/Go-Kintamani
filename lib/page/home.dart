import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/asset_image_rounded.dart';
import 'package:flutter_application_1/components/asset_image_widget.dart';
import 'package:flutter_application_1/components/text_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Test 2'),
            ),
            Text('Test Row 2')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text('test 1'), Text('test 2'), Text('Test 3')],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [Text('text 1'), Text('text 2')],
            ),
            Column(
              children: [Text('text 1'), Text('text 2')],
            )
          ],
        ),
        Divider(),
        Card(
          color: Colors.amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          borderOnForeground: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('test'), Text('test')],
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [Text('Home screen 1'), Text('Homescreen 2')]),
            Column(children: [Text('Test 1'), Text('Test 2')])
          ],
        ),
        Divider(),
        Card(
          child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Test 1'), Text('Test 2')],
              )),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextContainer(
              text: 'Column 1',
              color: Colors.red,
              key: ValueKey(1),
            ),
            TextContainer(
                text: 'Column 2', color: Colors.green, key: ValueKey(2)),
            TextContainer(
                text: 'Column 3', color: Colors.blue, key: ValueKey(3)),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AssetImageWidget(
              imagePath: 'harry.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            AssetImageRounded(imagePath: 'assets/harry.jpg'),
            CircleAvatar(
                radius: 50.0, backgroundImage: AssetImage('assets/hulk.jpg'))
          ],
        )
      ],
    ));
  }
}
