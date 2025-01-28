import 'package:flutter/material.dart';
import 'package:rmdl/modal/driving_manual_modal.dart';
import 'package:rmdl/view/defensive_driving.dart';

class Advanced extends StatelessWidget {
  Advanced({super.key});

  List<DMModal> oftitle = [
    DMModal(title: "Vehicle Controls"),
    DMModal(title: "Night Driving"),
    DMModal(title: "Defense Driving"),
    DMModal(title: "Following Distance"),
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
                    if (i == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DefensiveDriving()));
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
