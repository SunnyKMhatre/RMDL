import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rmdl/modal/categorymodal.dart';
import 'package:http/http.dart' as http;
import 'package:rmdl/view/driving_manual.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: category == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 350,
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      // mainAxisSpacing: 130,
                    ),
                    itemCount: category!.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                          onTap: () {
                            if (i == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DrivingManual()));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.35,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.only(top: 50),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${category![i].catName}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                    232, 27, 35, 145),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                              ),
                                            ),
                                            Text(
                                              "${category![i].description}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 30),
                                          ],
                                        ),
                                      )),
                                    ),
                                    Positioned(
                                        top: -(MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.05),
                                        left:
                                            (MediaQuery.of(context).size.width *
                                                    0.3) /
                                                5,
                                        child: Image.network(
                                          category![i].catImage ?? "N/A",
                                          height: 100,
                                          fit: BoxFit.contain,
                                        )),
                                    Positioned(
                                        left: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.05),
                                        right: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.05),
                                        bottom: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.02),
                                        child: Image.asset(
                                            "assets/group_arrow.png")),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    }),
              ));
  }
}
