import 'package:flutter/material.dart';
import 'package:rmdl/view/homescreen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Road Master DL',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
            SizedBox(
              height: 50,
            ),
            ListTile(
                leading: Text(
              "About",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            ListTile(
              leading: Icon(
                Icons.language,
                color: Color(0XFF2b319e),
                size: 40,
              ),
              title: Text(
                "Language",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              subtitle: Text("English"),
            ),
            ListTile(
              leading: Icon(
                Icons.policy_outlined,
                color: Color(0XFF2b319e),
                size: 40,
              ),
              title: Text(
                "Privacy Policy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.send_rounded,
                color: Color(0XFF2b319e),
                size: 40,
              ),
              title: Text(
                "Share With Friends",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.description,
                color: Color(0XFF2b319e),
                size: 40,
              ),
              title: Text(
                "Term & Conditions",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.star_rounded,
                color: Color(0XFF2b319e),
                size: 40,
              ),
              title: Text(
                "Rate Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              top: -15,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/rectangle.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: 50,
              right: 20,
              left: 20,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Image.asset(
                    "assets/getstarted.png",
                    fit: BoxFit.cover,
                  ))),
          Positioned(
              bottom: 250, left: 20, right: 20, child: Image.asset("assets/group.png"))
        ],
      ),
    );
  }
}
