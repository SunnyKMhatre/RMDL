import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/controller/quecontroller.dart';
import 'package:rmdl/view/quizscreen.dart';
import 'package:rmdl/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsController()),
      
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: QuizScreen()
        // builder: EasyLoading.init(),
      ),
    );
  }
}
