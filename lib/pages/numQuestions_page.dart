import 'package:flutter/material.dart';
import 'package:trivia_app/pages/questions_page.dart';
import 'package:flutter/services.dart';

class numQuestions_page extends StatefulWidget {
  var difficulty;
  var category;
  numQuestions_page(
      {super.key, required this.difficulty, required this.category});

  @override
  State<numQuestions_page> createState() => _numQuestions_pageState();
}

class _numQuestions_pageState extends State<numQuestions_page> {
  final numController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000814),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('How long can you last?',
            style: TextStyle(
                color: Colors.grey[50],
                fontFamily: 'MonomaniacOne',
                fontSize: 28)),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/number.jpg'))),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't leave empty";
                    }
                    return null;
                  },
                  controller: numController,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.grey[50], fontFamily: 'Roboto'),
                  cursorColor: Colors.greenAccent,
                  decoration: InputDecoration(
                    hintText: 'Enter the number of Questions',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.grey[50],
                    ),
                    filled: true,
                    fillColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: TextButton(
                style: TextButton.styleFrom(
                    shape: StadiumBorder(side: BorderSide(width: 1)),
                    side: BorderSide(
                      width: 1,
                      color: Colors.white,
                    )),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => questions_page(
                              amount: numController.text,
                              difficulty: widget.difficulty,
                              category: widget.category,
                            )));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Let\'s Go !',
                    style:
                        TextStyle(color: Colors.grey[50], fontFamily: 'Roboto'),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
