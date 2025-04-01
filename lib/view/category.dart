import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/controller/dm_controller.dart/dma_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmb_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmi_controller.dart';
import 'package:rmdl/controller/pt_controller/pta_controller.dart';
import 'package:rmdl/controller/pt_controller/ptb_controller.dart';
import 'package:rmdl/controller/pt_controller/pti_controller.dart';
import 'package:rmdl/controller/rr_controller/rra_controller.dart';
import 'package:rmdl/controller/rr_controller/rrb_controller.dart';
import 'package:rmdl/controller/rr_controller/rri_controller.dart';
import 'package:rmdl/controller/ts_controller/tsa_controller.dart';
import 'package:rmdl/controller/ts_controller/tsb_controller.dart';
import 'package:rmdl/controller/ts_controller/tsi_controller.dart';
import 'package:rmdl/controller/vo_controller/voa_controller.dart';
import 'package:rmdl/controller/vo_controller/vob_controller.dart';
import 'package:rmdl/controller/vo_controller/voi_controller.dart';
import 'package:rmdl/modal/categorymodal.dart';
import 'package:http/http.dart' as http;
import 'package:rmdl/view/ParkingTechScreen.dart';
import 'package:rmdl/view/RoadRuleScreen.dart';
import 'package:rmdl/view/drivingmanualscreem.dart';
import 'package:rmdl/view/trafficscenarioscreen.dart';
import 'package:rmdl/view/vehicaloperationscreen.dart';

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
    final dmcontroller1 = context.read<DmbController>();
    final dmcontroller2 = context.read<DmiController>();
    final dmcontroller3 = context.read<DmaController>();
    final ptcontroller1 = context.read<PtbController>();
    final ptcontroller2 = context.read<PtiController>();
    final ptcontroller3 = context.read<PtaController>();
    final rrcontroller1 = context.read<RrbController>();
    final rrcontroller2 = context.read<RriController>();
    final rrcontroller3 = context.read<RraController>();
    final tscontroller1 = context.read<TsbController>();
    final tscontroller2 = context.read<TsiController>();
    final tscontroller3 = context.read<TsaController>();
    final vocontroller1 = context.read<VobController>();
    final vocontroller2 = context.read<VoiController>();
    final vocontroller3 = context.read<VoaController>();
    return Scaffold(
        body: category == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 260,
                      crossAxisCount: 2,
                      // crossAxisSpacing: 10,
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
                                      builder: (context) =>
                                          DrivingManualScreen()));
                              dmcontroller1.dmbdata();
                              dmcontroller2.dmidata();
                              dmcontroller3.dmadata();
                            } else if (i == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ParkingTechScreen()));
                              ptcontroller1.ptbdata();
                              ptcontroller2.ptidata();
                              ptcontroller3.ptadata();
                            } else if (i == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RoadRuleScreen()));
                              rrcontroller1.rrbdata();
                              rrcontroller2.rridata();
                              rrcontroller3.rradata();
                            } else if (i == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TrafficScenarioScreen()));
                              tscontroller1.tsbdata();
                              tscontroller2.tsidata();
                              tscontroller3.tsadata();
                            } else if (i == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VehicalOperationScreen()));
                              vocontroller1.vobdata();
                              vocontroller2.voidata();
                              vocontroller3.voadata();
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
                                              0.27,
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
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${category![i].catName}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                    232, 27, 35, 145),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              "${category![i].description}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
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
                                                    0.5) /
                                                5,
                                        child: Image.network(
                                          category![i].catImage ?? "N/A",
                                          height: 75,
                                          fit: BoxFit.contain,
                                        )),
                                    Positioned(
                                        left: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            0.05),
                                        right: (MediaQuery.of(
                                                    context)
                                                .size
                                                .height *
                                            0.05),
                                        bottom: (MediaQuery.of(context)
                                                .size
                                                .height *
                                            0),
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
