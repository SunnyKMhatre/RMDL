import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/common_widgets/commonlistpage.dart';
import 'package:rmdl/common_widgets/commontabscreen.dart';
import 'package:rmdl/common_widgets/descriptionscreen.dart';
import 'package:rmdl/controller/pt_controller/pta_controller.dart';
import 'package:rmdl/controller/pt_controller/ptb_controller.dart';
import 'package:rmdl/controller/pt_controller/pti_controller.dart';

class ParkingTechScreen extends StatelessWidget {
  const ParkingTechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ptcontroller1 = context.watch<PtbController>();
    final ptcontroller2 = context.watch<PtiController>();
    final ptcontroller3 = context.watch<PtaController>();

    return (ptcontroller1.responce == null || ptcontroller2.responce == null || ptcontroller3.responce == null)
        ? Center(child: CircularProgressIndicator())
        : CommonTabScreen(
            title: "Parking Techniques",
            tabs: [
              TabData(
                icon: "assets/beginner.png",
                page: CommonListPage(
                  items: ptcontroller1.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < ptcontroller1.responce!.length) {
                      final name = ptcontroller1.responce![index].name ??
                          "No name available";
                      final description =
                          ptcontroller1.responce![index].description ??
                              "No description available";

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                              name: name, description: description),
                        ),
                      );
                    }
                  },
                ),
              ),
              TabData(
                icon: "assets/intermediate.png",
                page: CommonListPage(
                  items: ptcontroller2.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < ptcontroller2.responce!.length) {
                      final name = ptcontroller2.responce![index].name ??
                          "No name available";
                      final description =
                          ptcontroller2.responce![index].description ??
                              "No description available";

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                              name: name, description: description),
                        ),
                      );
                    }
                  },
                ),
              ),
              TabData(
                icon: "assets/advanced.png",
                page: CommonListPage(
                  items: ptcontroller3.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < ptcontroller3.responce!.length) {
                      final name = ptcontroller3.responce![index].name ??
                          "No name available";
                      final description =
                          ptcontroller3.responce![index].description ??
                              "No description available";

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                              name: name, description: description),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
  }
}