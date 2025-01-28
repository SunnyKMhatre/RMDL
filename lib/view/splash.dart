import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rmdl/view/route1.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Route1()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/splashback.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Image.asset("assets/icon.png")),
          Positioned(
            top: 450,
            left: 0,
            right: 0,
            child: Center(
                child: Text(
              "Road Master | Driving Lessons",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Positioned(
            top: 450,
            left: 0,
            right: 0,
            child: Image.asset("assets/Car.png"),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
                child: Text(
              '"This Action May Contain Ads"',
              style: TextStyle(color: Colors.white),
            )),
          )
        ],
      ),
    );
  }
}
