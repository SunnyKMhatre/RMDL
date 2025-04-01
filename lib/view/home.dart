import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/controller/dm_controller.dart/dma_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmb_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmi_controller.dart';
import 'package:rmdl/controller/question_controller/dl_test_question_controller.dart';
import 'package:rmdl/controller/ts_controller/tsa_controller.dart';
import 'package:rmdl/controller/ts_controller/tsb_controller.dart';
import 'package:rmdl/controller/ts_controller/tsi_controller.dart';
import 'package:rmdl/modal/categorymodal.dart';
import 'package:rmdl/modal/testmodal.dart';
import 'package:http/http.dart' as http;
import 'package:rmdl/view/category.dart';
import 'package:rmdl/view/dl_quiz.dart';
import 'package:rmdl/view/drivingmanualscreem.dart';
import 'package:rmdl/view/test.dart';
import 'package:rmdl/view/trafficscenarioscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TestModal> test = [
    TestModal(image: "assets/RTOExam.png", name: "RTO\nExam"),
    TestModal(image: "assets/TracfficScenarios.png", name: "Tracffic\nScenari"),
    TestModal(image: "assets/DrivingInstruction.png", name: "Driving\nInstruction"),
  ];
  @override
  Widget build(BuildContext context) {
    final dmcontroller1 = context.read<DmbController>();
    final dmcontroller2 = context.read<DmiController>();
    final dmcontroller3 = context.read<DmaController>();
    final rtoexamcontroller = context.read<DlTestQuestionController>();
    final tscontroller1 = context.read<TsbController>();
    final tscontroller2 = context.read<TsiController>();
    final tscontroller3 = context.read<TsaController>();
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Image.asset(
                "assets/component.png",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              // bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Features",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < test.length; i++) ...[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (i == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DlQuiz()));
                                        rtoexamcontroller.questiondata();
                                      } else if (i == 1) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TrafficScenarioScreen()));
                                        tscontroller1.tsbdata();
                                        tscontroller2.tsidata();
                                        tscontroller3.tsadata();
                                      } else if (i == 2) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DrivingManualScreen()));
                                        dmcontroller1.dmbdata();
                                        dmcontroller2.dmidata();
                                        dmcontroller3.dmadata();
                                      }
                                    },
                                    child: Container(
                                      height: 120,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${test[i].name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -15,
                                    left: 0,
                                    right: 0,
                                    child: Image.asset(
                                      "${test[i].image}",
                                      height: 50,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Driving Lessons",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DrivingManualScreen()));
                      dmcontroller1.dmbdata();
                      dmcontroller2.dmidata();
                      dmcontroller3.dmadata();
                    },
                    child: Image.asset(
                      "assets/driving_lessone.JPG",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
