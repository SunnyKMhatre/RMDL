import 'package:flutter/material.dart';
import 'package:rmdl/view/category.dart';
import 'package:rmdl/view/home.dart';
import 'package:rmdl/view/test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Road Master DL',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(232, 27, 35, 145),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset("assets/icon.png"),
                ListTile(
                    leading: Text(
                  "About",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Icon(
                    Icons.language,
                    color: Color(0XFF2b319e),
                    size: 20,
                  ),
                  title: Text(
                    "Language",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text("English"),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Icon(
                    Icons.policy_outlined,
                    color: Color(0XFF2b319e),
                    size: 20,
                  ),
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Icon(
                    Icons.send_rounded,
                    color: Color(0XFF2b319e),
                    size: 20,
                  ),
                  title: Text(
                    "Share With Friends",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Icon(
                    Icons.description,
                    color: Color(0XFF2b319e),
                    size: 20,
                  ),
                  title: Text(
                    "Term & Conditions",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Icon(
                    Icons.star_rounded,
                    color: Color(0XFF2b319e),
                    size: 20,
                  ),
                  title: Text(
                    "Rate Us",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: const Color.fromARGB(232, 27, 35, 145),
            child: TabBar(
                unselectedLabelColor: Colors.black,
                indicatorColor: const Color.fromARGB(232, 27, 35, 145),
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_rounded),
                    text: "Home",
                  ),
                  Tab(
                    icon: Icon(Icons.grid_view_rounded),
                    text: "Category",
                  ),
                  Tab(
                    icon: Icon(Icons.article_rounded),
                    text: "Test",
                  )
                ]),
          ),
          body: TabBarView(children: [Home(), Category(), Test()]),
        ));
  }
}
