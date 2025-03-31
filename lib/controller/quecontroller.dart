import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rmdl/modal/dm_modals/quetion_modal.dart';

class NewsController extends ChangeNotifier {
  List<Quemodal>? responce;

  NewsController() {
    newsdata();
  }
  void newsdata() async {
    try {
      var api = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/rto_advanced/test_data?cat_id=2"));

      if (api.statusCode == 200) {
        responce = Quemodal.ofquemodal(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("No API Fetch");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
