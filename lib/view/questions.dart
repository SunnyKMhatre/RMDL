import 'package:flutter/material.dart';
import 'package:rmdl/view/dashboard.dart';

class QuestionSlider extends StatefulWidget {
  @override
  _QuestionSliderState createState() => _QuestionSliderState();
}

class _QuestionSliderState extends State<QuestionSlider> {
  int _currentQuestion = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Have You Ever Driven A Vehicle Before?',
      'options': ['Yes', 'No'],
    },
    {
      'question':
          "What's The Legal Age For Obtaining A Learner Permit In Your Area?",
      'options': ['16', '18', '21'],
    },
    {
      'question':
          "What's The Legal Age For Obtaining A Permanent Driving License In Your Area?",
      'options': ['16', '18', '21'],
    },
    {
      'question': 'Do You Know Any Driving Rules?',
      'options': [
        "Yes,I'm Familiar With Most Rules",
        'I Know A Few Basic Rules',
        "No, I'm New To Driving"
      ],
    },
    {
      'question': 'What Should You Do At A Stop Sign?',
      'options': [
        'Slow Down',
        'Come To A Complete Stop',
        'Ignore It And Keep Going'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Questions',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 16, 96, 187),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/splashback.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _questions.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor:
                        index == _currentQuestion ? Colors.blue : Colors.white,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
              child: Container(
            height: 430,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      question['question'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[900],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...question['options'].map<Widget>((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentQuestion < _questions.length - 1) {
                            setState(() {
                              _currentQuestion++;
                            });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()),
                            );
                          }
                        },
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          )),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Note: Your valuable input in responding to these questions will greatly assist us to understand your knowledge and expertise in the field of driving.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
