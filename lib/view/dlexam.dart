import 'package:flutter/material.dart';
import 'package:rmdl/view/homescreen.dart';
import 'package:rmdl/view/result.dart';
import 'package:rmdl/view/test.dart';

class Dlexam extends StatelessWidget {
  const Dlexam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Exam",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/alert.png"),
              SizedBox(
                height: 20,
              ),
              Text("Are you sure you want to cancle the exam ?"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Result()));
                    },
                    child: Text(
                      "NO",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 252, 252, 253)),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xff2b319e)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
