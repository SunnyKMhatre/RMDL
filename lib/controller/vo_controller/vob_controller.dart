import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rmdl/modal/categ_modal.dart';

class VobController extends ChangeNotifier {
  List<CategModal>? responce;

  void vobdata() async {
    try {
      var api = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/rto_advanced/post_list?cat_id=5&level=beginner"));

      if (api.statusCode == 200) {
        responce = CategModal.ofcatmodal(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("No API Fetch");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
