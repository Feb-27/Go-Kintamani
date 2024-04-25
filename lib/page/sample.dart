import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(child: Image(image: AssetImage("assets/harry.jpg"))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Gunung Batur'),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text('4.5'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.call,
              ),
              Icon(
                Icons.send,
              ),
              Icon(
                Icons.share,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[Text('Call'), Text('Route'), Text('Share')],
          ),
          Container(
            child: Text('Gunung Batur adalah gunung yang tinggi'),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              trailing: new Icon(Icons.home),
            ),
            ListTile(
              title: const Text('Notification'),
              trailing: new Icon(Icons.notifications_none),
            ),
            Divider(
              height: 2,
            ),
            ListTile(
              title: const Text('Setting'),
              trailing: new Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
