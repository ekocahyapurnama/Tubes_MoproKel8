import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tubes_moprokel8/Dashboard/add_item.dart';
import 'package:tubes_moprokel8/Dashboard/add_item2.dart';
import 'package:tubes_moprokel8/Dashboard/detailpage.dart';
import 'package:tubes_moprokel8/Dashboard/tile.dart';
import 'package:tubes_moprokel8/constant/const.dart';
import 'package:tubes_moprokel8/Services/AuthServices.dart';
import 'package:tubes_moprokel8/pages/welkampage.dart';

class Dashboardpage extends StatefulWidget {
  @override
  _DashboardpageState createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'Where You',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          Text(
            ' Go?',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ]),
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.upload_file),
            title: Text('Tambah Destinasi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItem(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.upload_file),
            title: Text('Tambah Kuliner'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItem2(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Keluar'),
            onTap: () async {
              await _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Welkampage(),
                ),
              );
            },
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.place_outlined), label: "Destinasi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank), label: "Kuliner"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "About Us"),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        color: Colors.grey,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('newsdata').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data.docs.map((document) {
                Item item = Item(
                  title: document['title'],
                  author: document['author'],
                  imgUrl: document['imgUrl'],
                  desc: document['desc'],
                  id: document['id'],
                );
                return InkWell(
                  child: NewsTile(item: item),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(item: item, id: document['id']),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        color: Colors.grey,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('kuliner').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data.docs.map((document) {
                Item item = Item(
                  title: document['title'],
                  author: document['author'],
                  imgUrl: document['imgUrl'],
                  desc: document['desc'],
                  id: document['id'],
                );
                return InkWell(
                  child: NewsTile(item: item),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(item: item, id: document['id']),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Center(
                            child: Container(
                              child: Transform.translate(
                                offset: Offset(45, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/anggi.png"),
                                      radius: 40.0,
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, 0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/eko.png"),
                                        radius: 40.0,
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, 0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/rahmat.png"),
                                        radius: 40.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Kelompok 8 Mobile Programming",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "TIF K 18 A",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Nama Aplikasi: Where You Go?",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Member:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Text("Anggi Depitasari - 18111248"),
                              Text("Eko Cahya Purnama - 18111260"),
                              Text("Rahmat Hidayat Permana - 18111273"),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("College:",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Text("Sekolah Tinggi Teknologi Bandung"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
