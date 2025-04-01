import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/controller/question_controller/cdl_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/dl_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/mcl_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/ms_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/road_test_question_controller.dart';
import 'package:rmdl/view/cdl_quiz.dart';
import 'package:rmdl/view/dl_quiz.dart';
import 'package:rmdl/view/mcl_quiz.dart';
import 'package:rmdl/view/ms_quiz.dart';
import 'package:rmdl/view/road_quiz.dart';

class DltInstruction extends StatelessWidget {
  final int testIndex;
  const DltInstruction({super.key, required this.testIndex});

  @override
  Widget build(BuildContext context) {
    final dlcontroller = context.read<DlTestQuestionController>();
    final roadcontroller = context.read<RoadTestQuestionController>();
    final mclcontroller = context.read<MclTestQuestionController>();
    final cdlcontroller = context.read<CdlTestQuestionController>();
    final mscontroller = context.read<MsTestQuestionController>();

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
                if (testIndex == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DlQuiz()));
                      dlcontroller.questiondata();
                } else if (testIndex == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RoadQuiz()));
                      roadcontroller.questiondata();
                } else if (testIndex == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MclQuiz()));
                      mclcontroller.questiondata();
                } else if (testIndex == 3) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CdlQuiz()));
                      cdlcontroller.questiondata();
                } else if (testIndex == 4) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MsQuiz()));
                      mscontroller.questiondata();
                }
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
