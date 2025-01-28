import 'package:flutter/material.dart';
import 'package:rmdl/modal/testmodal.dart';
import 'package:rmdl/view/dlt_instruction.dart';

class Test extends StatelessWidget {
   Test({super.key});

   List<TestModal> test = [
    TestModal(
        image: "assets/dl_test.png",
        name: "Driver's License Test",
        subtitle: "Prepare For Your Driver's License With Our Test Guide"),
    TestModal(
        image: "assets/road_test.png",
        name: "Road Test",
        subtitle: "Master Your Road Test With Expert Tips And Practices"),
    TestModal(
        image: "assets/ml_test.png",
        name: "Motorcycle License Test",
        subtitle: "Get Specialized Study Materials To Ace Your Test"),
    TestModal(
        image: "assets/codl_test.png",
        name: "Commercial Driver's License Test",
        subtitle: "Prepare For Your Exam And Hit The Road"),
    TestModal(
        image: "assets/ms_test.png",
        name: "Motorcycle Skills Test",
        subtitle:
            "Learn Motorcycle Control Skills In A Practical, Hands-On Test")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < test.length; i++) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  onTap: () {
                    if (i == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DltInstruction()));
                    }
                  },
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("${test[i].image}"),
                  ),
                  title: Text(
                    "${test[i].name}",
                    style: TextStyle(
                      color: const Color.fromARGB(232, 27, 35, 145),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text("${test[i].subtitle}"),
                  trailing: Image.asset("assets/group_arrow.png"),
                ),
              ),
            ),
          ]
        ],
      ),
    ));
  }

}
