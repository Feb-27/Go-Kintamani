import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/petani.dart';
import 'package:flutter_application_1/page/foods.dart';
import 'package:flutter_application_1/page/longList.dart';
import 'package:flutter_application_1/page/front.dart';
import 'package:flutter_application_1/page/hotels.dart';
import 'package:flutter_application_1/page/destination.dart';
import 'package:flutter_application_1/page/form.dart';
import 'package:flutter_application_1/page/petaniPage.dart';
import 'package:flutter_application_1/services/apiStatic.dart';

void main() {
  runApp(const MyHome(
    title: '',
  ));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late Future<List<Petani>> futurePetani; // Perbaikan tipe data Future

  final ApiStatic apiStatic = ApiStatic();

  @override
  void initState() {
    super.initState();
    futurePetani =
        apiStatic.fetchPetani(); // Perbaikan inisialisasi futurePetani
  }

  final List<Widget> _screen = [
    MySlider(), // Perbaikan MySlider
    DestinationScreen(),
    HotelScreen(),
    FoodScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'Destination',
    'Hotels',
    'Foods',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigatetoFormPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => FormPage()));
  }

  void _navigatetoListPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LongList()));
  }

  void _navigatetoPetaniPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => DatasScreen(futurePetani: futurePetani)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Desa Kintamani"),
              accountEmail: Text("kintamani@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/images/Lambang_Kab_Bangli.png"), // Sesuaikan dengan path gambar Anda
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text("Laman Pengaduan"),
              onTap: () {
                _navigatetoFormPage(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Long List"),
              onTap: () {
                _navigatetoListPage(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.filter_vintage),
              title: Text("Petani Page"),
              onTap: () {
                _navigatetoPetaniPage(context);
              },
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
          ],
        ),
      ),
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // Perbaikan untuk membuat semua item terlihat
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom),
            label: 'Destination',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.holiday_village),
            label: 'Hotels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bento_rounded),
            label: 'Foods',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
