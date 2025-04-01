import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/controller/dm_controller.dart/dma_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmb_controller.dart';
import 'package:rmdl/controller/dm_controller.dart/dmi_controller.dart';
import 'package:rmdl/controller/pt_controller/pta_controller.dart';
import 'package:rmdl/controller/pt_controller/ptb_controller.dart';
import 'package:rmdl/controller/pt_controller/pti_controller.dart';
import 'package:rmdl/controller/question_controller/cdl_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/dl_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/mcl_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/ms_test_question_controller.dart';
import 'package:rmdl/controller/question_controller/road_test_question_controller.dart';
import 'package:rmdl/controller/rr_controller/rra_controller.dart';
import 'package:rmdl/controller/rr_controller/rrb_controller.dart';
import 'package:rmdl/controller/rr_controller/rri_controller.dart';
import 'package:rmdl/controller/ts_controller/tsa_controller.dart';
import 'package:rmdl/controller/ts_controller/tsb_controller.dart';
import 'package:rmdl/controller/ts_controller/tsi_controller.dart';
import 'package:rmdl/controller/vo_controller/voa_controller.dart';
import 'package:rmdl/controller/vo_controller/vob_controller.dart';
import 'package:rmdl/controller/vo_controller/voi_controller.dart';
import 'package:rmdl/view/category.dart';
import 'package:rmdl/view/home.dart';
import 'package:rmdl/view/homescreen.dart';
import 'package:rmdl/view/splash.dart';
import 'package:rmdl/view/termsofuse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DmbController()),
        ChangeNotifierProvider(create: (context) => DmiController()),
        ChangeNotifierProvider(create: (context) => DmaController()),
        ChangeNotifierProvider(create: (context) => PtbController()),
        ChangeNotifierProvider(create: (context) => PtiController()),
        ChangeNotifierProvider(create: (context) => PtaController()),
        ChangeNotifierProvider(create: (context) => RrbController()),
        ChangeNotifierProvider(create: (context) => RriController()),
        ChangeNotifierProvider(create: (context) => RraController()),
        ChangeNotifierProvider(create: (context) => TsbController()),
        ChangeNotifierProvider(create: (context) => TsiController()),
        ChangeNotifierProvider(create: (context) => TsaController()),
        ChangeNotifierProvider(create: (context) => VobController()),
        ChangeNotifierProvider(create: (context) => VoiController()),
        ChangeNotifierProvider(create: (context) => VoaController()),
        ChangeNotifierProvider(create: (context) => DlTestQuestionController()),
        ChangeNotifierProvider(
            create: (context) => RoadTestQuestionController()),
        ChangeNotifierProvider(
            create: (context) => MclTestQuestionController()),
        ChangeNotifierProvider(
            create: (context) => CdlTestQuestionController()),
        ChangeNotifierProvider(create: (context) => MsTestQuestionController()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: Splash()
          // builder: EasyLoading.init(),
          ),
    );
  }
}
