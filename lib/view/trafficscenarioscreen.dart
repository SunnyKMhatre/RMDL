import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/common_widgets/commonlistpage.dart';
import 'package:rmdl/common_widgets/commontabscreen.dart';
import 'package:rmdl/common_widgets/descriptionscreen.dart';
import 'package:rmdl/controller/ts_controller/tsa_controller.dart';
import 'package:rmdl/controller/ts_controller/tsb_controller.dart';
import 'package:rmdl/controller/ts_controller/tsi_controller.dart';

class TrafficScenarioScreen extends StatelessWidget {
  const TrafficScenarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tscontroller1 = context.watch<TsbController>();
    final tscontroller2 = context.watch<TsiController>();
    final tscontroller3 = context.watch<TsaController>();

    return (tscontroller1.responce == null || tscontroller2.responce == null || tscontroller3.responce == null)
        ? Center(child: CircularProgressIndicator())
        : CommonTabScreen(
            title: "Traffic Scenarios",
            tabs: [
              TabData(
                icon: "assets/beginner.png",
                page: CommonListPage(
                  items: tscontroller1.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < tscontroller1.responce!.length) {
                      final name = tscontroller1.responce![index].name ??
                          "No name available";
                      final description =
                          tscontroller1.responce![index].description ??
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
                  items: tscontroller2.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < tscontroller2.responce!.length) {
                      final name = tscontroller2.responce![index].name ??
                          "No name available";
                      final description =
                          tscontroller2.responce![index].description ??
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
                  items: tscontroller3.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < tscontroller3.responce!.length) {
                      final name = tscontroller3.responce![index].name ??
                          "No name available";
                      final description =
                          tscontroller3.responce![index].description ??
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