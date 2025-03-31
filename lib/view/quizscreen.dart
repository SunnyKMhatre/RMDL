import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmdl/controller/quecontroller.dart';


class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  void checkAnswer(String selectedAnswer, String correctAnswer) {
    if (selectedAnswer == correctAnswer) {
      correctAnswers++;
    }
    setState(() {
      final controller = context.read<NewsController>();
      if (currentQuestionIndex < controller.responce!.length - 1) {
        currentQuestionIndex++;
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Quiz Completed"),
            content: Text("You got $correctAnswers correct answers!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    currentQuestionIndex = 0;
                    correctAnswers = 0;
                  });
                },
                child: Text("Restart"),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NewsController>();

    return Scaffold(
      appBar: AppBar(title: Text("Quiz App")),
      body: controller.responce == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Question ${currentQuestionIndex + 1}:", 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(controller.responce![currentQuestionIndex].question ?? "", 
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  ...[
                    controller.responce![currentQuestionIndex].option1,
                    controller.responce![currentQuestionIndex].option2,
                    controller.responce![currentQuestionIndex].option3,
                    controller.responce![currentQuestionIndex].option4
                  ].map(
                    (option) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ElevatedButton(
                        onPressed: () => checkAnswer(option, controller.responce![currentQuestionIndex].answer!),
                        child: Text(option!),
                      ),
                    ),
                  ).toList(),
                  Spacer(),
                  Text("Score: $correctAnswers", 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
    );
  }
}
