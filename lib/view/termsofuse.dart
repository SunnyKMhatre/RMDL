import 'package:flutter/material.dart';
import 'package:rmdl/view/questions.dart';

class Termsofuse extends StatelessWidget {
  const Termsofuse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Terms of Use",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "The application is notifying you to the presence of an app that provides several services that are essential information for safer and more efficient use.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  // textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "User-Generated content policy (UGC) by pressing the accept button:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Color(0XFF2b319e),
                    size: 40,
                  ),
                  title: Text(
                    "I declare I have read and accepted the following condition of use.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Color(0XFF2b319e),
                    size: 40,
                  ),
                  title: Text(
                    "If we find the app is being used outside its terms of use, we may restrict access to it.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Color(0XFF2b319e),
                    size: 40,
                  ),
                  title: Text(
                    "Any type of modification to the app or its components is not allowed.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    color: Color(0XFF2b319e),
                    size: 40,
                  ),
                  title: Text(
                    "Privacy Policy may be updated from time to time for any reason. We will notify you of any changes to our Privacy Policy by posting the new Privacy Policy here.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.block_flipped,
                    color: Color(0XFF2b319e),
                    size: 40,
                  ),
                  title: Text(
                    "We do not share any kind of your Personal Data with third parties.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        children: [
                      TextSpan(
                        text:
                            "You can find out more information by clicking on the\nFollowing link : ",
                      ),
                      TextSpan(
                          text: "Terms and conditions of use\n",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(text: "Following link : "),
                      TextSpan(
                          text: "Privacy policy.\n",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      TextSpan(
                        text:
                            "You can find out more information by clicking on the",
                      ),
                    ])),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionSlider()));
                  },
                  child: Text(
                    "Accept",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(Size(200, 50)),
                    backgroundColor: WidgetStateProperty.all(
                      Color(0XFF2b319e),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
