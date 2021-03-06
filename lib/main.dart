import 'package:flutter/material.dart';
import 'package:fmarket/sepetim.dart';
import 'package:fmarket/urunler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  int _aktifIcerikNo = 0;
  List<Widget>? _icerikler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _icerikler=[
      Urunler(),
      Sepetim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red[400]),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Uçarak Gelsin",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
        ),
      ),
      body: _icerikler?[_aktifIcerikNo],

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Selçuk Mert"),
              accountEmail: Text("selm123@mailim.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508_960_720.jpg"),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red[400]),
            ),
            ListTile(title: Text("Siparişlerim"), onTap: (){},),
            ListTile(title: Text("İndirimlerim"), onTap: (){},),
            ListTile(title: Text("Ayarlar"), onTap: (){},),
            ListTile(title: Text("Çıkış Yap"), onTap: (){
              Navigator.pop(context);
            },),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifIcerikNo,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Ürünler")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title: Text("Sepetim")),
        ],
        onTap: (int tiklananButtonPozisyonNo){

          setState(() {
            _aktifIcerikNo = tiklananButtonPozisyonNo;
          });

        },
      ),

    );
  }
}

