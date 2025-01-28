import 'package:flutter/material.dart';
import 'package:rmdl/modal/driving_manual_modal.dart';
import 'package:rmdl/view/speed_control.dart';

class Intermediate extends StatelessWidget {
  Intermediate({super.key});

  List<DMModal> oftitle = [
    DMModal(title: "Speed Control"),
    DMModal(title: "Parking Basics"),
    DMModal(title: "Adverse Weather Conditions"),
    DMModal(title: "Legal And Licensing Requirements"),
    DMModal(title: "Changing Lanes And Merging"),
    DMModal(title: "Basic Vehicle Maintenace"),
    DMModal(title: "Distracted And Imapired Driving"),
    DMModal(title: "Right Of Way And Intersections"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          for (int i = 0; i < oftitle.length; i++) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  onTap: () {
                    if (i == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpeedControl()));
                    }
                  },
                  title: Text(
                    "${oftitle[i].title}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset("assets/group_arrow.png"),
                ),
              ),
            )
          ]
        ],
      )),
    );
  }
}
