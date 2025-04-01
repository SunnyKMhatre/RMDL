import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/common_widgets/commonlistpage.dart';
import 'package:rmdl/common_widgets/commontabscreen.dart';
import 'package:rmdl/common_widgets/descriptionscreen.dart';
import 'package:rmdl/controller/vo_controller/voa_controller.dart';
import 'package:rmdl/controller/vo_controller/vob_controller.dart';
import 'package:rmdl/controller/vo_controller/voi_controller.dart';

class VehicalOperationScreen extends StatelessWidget {
  const VehicalOperationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vocontroller1 = context.watch<VobController>();
    final vocontroller2 = context.watch<VoiController>();
    final vocontroller3 = context.watch<VoaController>();

    return (vocontroller1.responce == null || vocontroller2.responce == null || vocontroller3.responce == null)
        ? Center(child: CircularProgressIndicator())
        : CommonTabScreen(
            title: "Vehicle Operation",
            tabs: [
              TabData(
                icon: "assets/beginner.png",
                page: CommonListPage(
                  items: vocontroller1.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < vocontroller1.responce!.length) {
                      final name = vocontroller1.responce![index].name ??
                          "No name available";
                      final description =
                          vocontroller1.responce![index].description ??
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
                  items: vocontroller2.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < vocontroller2.responce!.length) {
                      final name = vocontroller2.responce![index].name ??
                          "No name available";
                      final description =
                          vocontroller2.responce![index].description ??
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
                  items: vocontroller3.responce!
                      .map((item) => item.name ?? "")
                      .toList(),
                  onItemTap: (index) {
                    if (index >= 0 && index < vocontroller3.responce!.length) {
                      final name = vocontroller3.responce![index].name ??
                          "No name available";
                      final description =
                          vocontroller3.responce![index].description ??
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
