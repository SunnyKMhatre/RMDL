import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rmdl/modal/categorymodal.dart';
import 'package:rmdl/modal/testmodal.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Categorymodal>? category;
  void getcategory() async {
    try {
      var api = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/rto_advanced/category_list"));
      if (api.statusCode == 200) {
        category = Categorymodal.categ(jsonDecode(api.body));
        setState(() {});
      }
    } catch (e) {
      print("Category Modal error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcategory();
  }

  List<TestModal> test = [
    TestModal(image: "assets/dl_test.png", name: "Driver's\nLicense\nTest"),
    TestModal(image: "assets/road_test.png", name: "Road\nTest"),
    TestModal(image: "assets/ml_test.png", name: "Motorcycle\nLicense\nTest"),
    TestModal(
        image: "assets/codl_test.png", name: "Commercial\nDriver's\nLicense Test"),
    TestModal(image: "assets/ms_test.png", name: "Motorcycle\nSkills\nTest")
  ];
  @override
  Widget build(BuildContext context) {
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
              top: MediaQuery.of(context).size.height * 0.22,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Test",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < test.length; i++) ...[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 120,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${test[i].name}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -20,
                                  left: 0,
                                  right: 0,
                                  child: Image.asset(
                                    "${test[i].image}",
                                    height: 60,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                  Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  category == null
                      ? Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < category!.length; i++) ...[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
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
                                              "${category![i].catName}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: -20,
                                            left: 0,
                                            right: 0,
                                            child: Image.network(
                                              category![i].catImage ?? "N/A",
                                              height: 60,
                                              fit: BoxFit.contain,
                                            )),
                                      ],
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ),
                        ),
                ],
              )),
        ],
      ),
    ));
  }
}
