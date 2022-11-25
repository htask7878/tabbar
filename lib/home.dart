import 'package:flutter/material.dart';
import 'package:tabbar/first.dart';
import 'package:tabbar/fourth.dart';
import 'package:tabbar/second.dart';
import 'package:tabbar/third.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  TabController? tabController;
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      endDrawer:
          Drawer(child: Container(color: Colors.amberAccent), width: 250),
      drawer: Drawer(
          width: 280,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("image/camera.png"),fit: BoxFit.cover)),
                  // currentAccountPicture: Image(
                  //     image: AssetImage("image/ht_logo.png"), fit: BoxFit.cover),
                  accountName: Text("htflutter"),
                  accountEmail: Text("ht.f7@gmail.con")),
              ListTile(
                onTap: () {
                  tabController!.animateTo(0);
                  Navigator.pop(context);
                },
                title: Text("first"),
                leading: Icon(Icons.alarm),
              ),
              ListTile(
                onTap: () {
                  tabController!.animateTo(1);
                  Navigator.pop(context);
                },
                title: Text("second"),
                leading: Icon(Icons.ac_unit_sharp),
              ),
              ListTile(
                onTap: () {
                  tabController!.animateTo(2);
                  Navigator.pop(context);
                },
                title: Text("third"),
                leading: Icon(Icons.adb),
              ),
              ListTile(
                onTap: () {
                  tabController!.animateTo(3);
                  Navigator.pop(context);
                },
                title: Text("fourth"),
                leading: Icon(Icons.account_balance_wallet),
              ),
            ],
          )),

      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (value) {},
              itemBuilder: (
                context,
              ) =>
                  [
                    PopupMenuItem(
                        child: Text("First"),
                        onTap: () => tabController!.animateTo(0)),
                    PopupMenuItem(
                        child: Text("second"),
                        onTap: () => tabController!.animateTo(1)),
                    PopupMenuItem(
                        child: Text("third"),
                        onTap: () => tabController!.animateTo(2)),
                    PopupMenuItem(
                        child: Text("fourth"),
                        onTap: () => tabController!.animateTo(3)),
                  ]),
        ],
        title: Text("Tabbar"),
        bottom: TabBar(
          onTap: (value) {
            setState(() {
              i = value;
              tabController!.animateTo(value);
            });
          },
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              // icon: Icon(Icons.camera_alt),
              text: "first",
            ),
            Tab(
              text: "second",
            ),
            Tab(
              text: "third",
            ),
            Tab(
              text: "fourth",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        splashColor: Colors.purpleAccent,
        label: Icon(Icons.accessibility_new_rounded),
        onPressed: () {
          tabController!.animateTo(1);
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      // bottomSheet: Text("Beladiya",
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              i = value;
              tabController!.animateTo(value);
            });
          },
          currentIndex: i,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          showSelectedLabels: true,
          selectedItemColor: Colors.purpleAccent,
          unselectedItemColor: Colors.green,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm), label: "first"),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit_sharp), label: "Second"),
            BottomNavigationBarItem(
                icon: Icon(Icons.adb_rounded), label: "Third"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_sharp),
                label: "Fourth"),
          ]),
      // resizeToAvoidBottomInset: true,

      body: TabBarView(
        controller: tabController,
        children: [
          first(),
          second(),
          third(),
          fourth(),
        ],
      ),
    );
  }
}
