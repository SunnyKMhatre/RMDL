import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/common_widgets/commonlistpage.dart';
import 'package:rmdl/common_widgets/commontabscreen.dart';
import 'package:rmdl/common_widgets/descriptionscreen.dart';
import 'package:rmdl/controller/dm_controller.dart/dma_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmb_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmi_controller.dart';

class DrivingManualScreen extends StatelessWidget {
  const DrivingManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dmcontroller1 = context.watch<DmbController>();
    final dmcontroller2 = context.watch<DmiController>();
    final dmcontroller3 = context.watch<DmaController>();

    return (dmcontroller1.responce == null ||
            dmcontroller2.responce == null ||
            dmcontroller3.responce == null)
        ? Center(child: CircularProgressIndicator())
        : CommonTabScreen(
            title: "Driving Manuals",
            tabs: [
              TabData(
                icon: "assets/beginner.png",
                page: CommonListPage(
                  items: dmcontroller1.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < dmcontroller1.responce!.length) {
                      final name = dmcontroller1.responce![index].name ??
                          "No name available";
                      final description =
                          dmcontroller1.responce![index].description ??
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
                  items: dmcontroller2.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < dmcontroller2.responce!.length) {
                      final name = dmcontroller2.responce![index].name ??
                          "No name available";
                      final description =
                          dmcontroller2.responce![index].description ??
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
                  items: dmcontroller3.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < dmcontroller3.responce!.length) {
                      final name = dmcontroller3.responce![index].name ??
                          "No name available";
                      final description =
                          dmcontroller3.responce![index].description ??
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
