import 'package:flutter/material.dart';
import 'package:rmdl/view/dlexam.dart';

class DltInstruction extends StatelessWidget {
  const DltInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Instruction",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: Image.asset("assets/finger.png"),
              title: Text(
                "During your RTO test, you'll encounter questions covering a range of topics. These include signs and signals, traffic rules, and regulations.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            ListTile(
              leading: Image.asset("assets/finger.png"),
              title: Text(
                "In the examination, you'll face a series of multiple choice questions as part of your learner's license test.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            ListTile(
              leading: Image.asset("assets/finger.png"),
              title: Text(
                "The test typically consists of 15 questions, and to pass, you must answer at least 11 of them correctly.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            ListTile(
              leading: Image.asset("assets/finger.png"),
              title: Text(
                "You'll have a maximum of 60 seconds to answer each question.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            ListTile(
              leading: Image.asset("assets/finger.png"),
              title: Text(
                "If you don't pass on your first attempt, you have the option to retake the test within a one-week period.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dlexam()));
              },
              child: Text(
                "Start Exam",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Color(0xff2b319e)),
              ),
            ),
          ],
        ));
  }
}
