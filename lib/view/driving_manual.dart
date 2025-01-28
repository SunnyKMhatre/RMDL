import 'package:flutter/material.dart';
import 'package:rmdl/view/advanced.dart';
import 'package:rmdl/view/beginner.dart';
import 'package:rmdl/view/intermediate.dart';

class DrivingManual extends StatelessWidget {
  const DrivingManual({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Driving Manuals",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(tabs: [
              Tab(
                icon: Image.asset("assets/beginner.png"),
              ),
              Tab(
                icon: Image.asset("assets/intermediate.png"),
              ),
              Tab(
                icon: Image.asset("assets/advanced.png"),
              )
            ]),
          ),
          body: TabBarView(children: [Beginner(), Intermediate(), Advanced()]),
        ));
  }
}
