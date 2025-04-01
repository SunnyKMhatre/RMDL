import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/common_widgets/commonlistpage.dart';
import 'package:rmdl/common_widgets/commontabscreen.dart';
import 'package:rmdl/common_widgets/descriptionscreen.dart';
import 'package:rmdl/controller/rr_controller/rra_controller.dart';
import 'package:rmdl/controller/rr_controller/rrb_controller.dart';
import 'package:rmdl/controller/rr_controller/rri_controller.dart';

class RoadRuleScreen extends StatelessWidget {
  const RoadRuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rrcontroller1 = context.watch<RrbController>();
    final rrcontroller2 = context.watch<RriController>();
    final rrcontroller3 = context.watch<RraController>();

    return (rrcontroller1.responce == null || rrcontroller2.responce == null || rrcontroller3.responce == null)
        ? Center(child: CircularProgressIndicator())
        : CommonTabScreen( 
            title: "Road Rules",
            tabs: [
              TabData(
                icon: "assets/beginner.png",
                page: CommonListPage(
                  items: rrcontroller1.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < rrcontroller1.responce!.length) {
                      final name = rrcontroller1.responce![index].name ??
                          "No name available";
                      final description =
                          rrcontroller1.responce![index].description ??
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
                  items: rrcontroller2.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < rrcontroller2.responce!.length) {
                      final name = rrcontroller2.responce![index].name ??
                          "No name available";
                      final description =
                          rrcontroller2.responce![index].description ??
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
                  items: rrcontroller3.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < rrcontroller3.responce!.length) {
                      final name = rrcontroller3.responce![index].name ??
                          "No name available";
                      final description =
                          rrcontroller3.responce![index].description ??
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