import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/controller/question_controller/road_test_question_controller.dart';

class RoadQuiz extends StatefulWidget {
  const RoadQuiz({super.key});

  @override
  State<RoadQuiz> createState() => _RoadQuizState();
}

class _RoadQuizState extends State<RoadQuiz> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  String? selectedAnswer;

  void checkAnswer(String? selectedOption) {
    final controller = context.read<RoadTestQuestionController>();
    final question = controller.responce![currentQuestionIndex];

    // Map answer index to actual text
    String? correctOption;
    switch (question.answer?.trim()) {
      case "1":
        correctOption = question.option1;
        break;
      case "2":
        correctOption = question.option2;
        break;
      case "3":
        correctOption = question.option3;
        break;
      case "4":
        correctOption = question.option4;
        break;
      default:
        correctOption = question.answer;
    }

    setState(() {
      selectedAnswer = selectedOption;
      if (selectedOption?.trim().toLowerCase() ==
          correctOption?.trim().toLowerCase()) {
        correctAnswers++;
      }
    });
  }

  void nextQuestion() {
    final controller = context.read<RoadTestQuestionController>();

    if (currentQuestionIndex < controller.responce!.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null; 
      });
    } else {
   
      bool isPassed = correctAnswers >= 11;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text(isPassed ? "🎉 Congratulations!" : "❌ Exam Failed"),
          content: Text(
            isPassed
                ? "You Passed the Exam! 🎯\nScore: $correctAnswers/15"
                : "You Failed the Exam! 😞\nScore: $correctAnswers/15\nTry Again!",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestionIndex = 0;
                  correctAnswers = 0;
                  selectedAnswer = null;
                });
              },
              child: Text("Restart"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RoadTestQuestionController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Start Exam"),
        centerTitle: true,
      ),
      body: controller.responce == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question ${currentQuestionIndex + 1}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    controller.responce![currentQuestionIndex].question ??
                        "No Question",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      controller.responce![currentQuestionIndex].option1,
                      controller.responce![currentQuestionIndex].option2,
                      controller.responce![currentQuestionIndex].option3,
                      controller.responce![currentQuestionIndex].option4
                    ]
                        .map(
                          (option) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: GestureDetector(
                              onTap: () => checkAnswer(option),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: selectedAnswer == option
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        option ?? "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: selectedAnswer == option
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    if (selectedAnswer == option)
                                      Icon(Icons.check, color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}