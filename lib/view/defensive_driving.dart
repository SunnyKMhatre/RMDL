import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rmdl/modal/dm_modals/defensive_driving_modal.dart';
import 'package:http/http.dart' as http;

class DefensiveDriving extends StatefulWidget {
  const DefensiveDriving({super.key});

  @override
  State<DefensiveDriving> createState() => _DefensiveDrivingState();
}

class _DefensiveDrivingState extends State<DefensiveDriving> {
  List<DefenceDriving>? responce;

  void getdefencedrive() async {
    try {
      var api = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/rto_advanced/post_list?cat_id=1&level=advanced"));
      if (api.statusCode == 200) {
        responce = DefenceDriving.ofdefendrive(jsonDecode(api.body));
        setState(() {});
      }
    } catch (e) {
      print("Modal error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdefencedrive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Defensive Driving",
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
