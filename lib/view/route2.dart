import 'package:flutter/material.dart';
import 'package:rmdl/view/route3.dart';

class Route2 extends StatelessWidget {
  const Route2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/route2.jpeg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Route3()));
              },
              child: Image.asset("assets/nextbutton.png"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}