import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rmdl/modal/dm_modals/intro_to_drive_modal.dart';
import 'package:http/http.dart' as http;

class IntroToDrive extends StatefulWidget {
  const IntroToDrive({super.key});

  @override
  State<IntroToDrive> createState() => _IntroToDriveState();
}

class _IntroToDriveState extends State<IntroToDrive> {
  List<IntroDriveModal>? responce;
  void getintrodrive() async {
    try {
      var api = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/rto_advanced/post_list?cat_id=1&level=beginner"));
      if (api.statusCode == 200) {
        responce = IntroDriveModal.ofintrodrive(jsonDecode(api.body));
        setState(() {});
      }
    } catch (e) {
      "Modal error: $e";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getintrodrive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Introduction to Driving",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          responce == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.blue.shade900, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "${responce![0].description}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
