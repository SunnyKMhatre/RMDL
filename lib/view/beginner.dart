import 'package:flutter/material.dart';
import 'package:rmdl/modal/driving_manual_modal.dart';
import 'package:rmdl/view/intro_to_drive.dart';

class Beginner extends StatelessWidget {
  Beginner({super.key});

  List<DMModal> oftitle = [
    DMModal(title: "Introduction to Driving"),
    DMModal(title: "Getting Started"),
    DMModal(title: "Starting And Stopping The Vehicle"),
    DMModal(title: "Steering And Turing"),
    DMModal(title: "Traffic Signs And Signals"),
    DMModal(title: "Sharing The Road"),
    DMModal(title: "Emergency Procedures"),
    DMModal(title: "Backing Up And Reversing"),
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
                              builder: (context) => IntroToDrive()));
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
