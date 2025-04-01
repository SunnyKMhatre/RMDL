import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:rmdl/modal/question_modal.dart';

class CdlTestQuestionController extends ChangeNotifier {
  List<QuestionModal>? responce;

  void questiondata() async {
    try {
      var api = await http.get(Uri.parse(
          "https://appy.trycatchtech.com/v3/rto_advanced/test_data?cat_id=4"));

      if (api.statusCode == 200) {
        responce = QuestionModal.ofqueationmodal(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("No API Fetch");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
