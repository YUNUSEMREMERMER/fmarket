import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmarket/kategori.dart';

class Urunler extends StatefulWidget {
  const Urunler({Key? key}) : super(key: key);

  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin {

  TabController? televizyonControlcusu;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    televizyonControlcusu = TabController(length: 4, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(

            controller: televizyonControlcusu,
            indicatorColor: Colors.red[400],
            labelColor: Colors.red[400],
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),
            tabs: [
          Tab(child: Text("temel gıda"),),
          Tab(child: Text("şekerleme"),),
          Tab(child: Text("içecekler"),),
          Tab(child: Text("temizlik"),),
        ]),
        
        Expanded(

          child: TabBarView(
            controller: televizyonControlcusu,
            children: [
              Kategori(kategori: "temel gıda",),
              Kategori(kategori: "şekerleme",),
              Kategori(kategori: "içecekler",),
              Kategori(kategori: "temizlik",),
            ],
          ),
        )
      ],
    );
  }
}
