import 'dart:convert';
import 'dart:async';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_app/pages/result_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/widgets/neumorphism.dart';

class questions_page extends StatefulWidget {
  var amount;
  var difficulty;
  var category;
  questions_page(
      {super.key,
      required this.amount,
      required this.difficulty,
      required this.category});

  @override
  State<questions_page> createState() => _questions_pageState();}
class _questions_pageState extends State<questions_page> {
  List questions = [];
  List<int> random = [];
  List Options = [];
  Future getQuestion() async {
    var response;
    if (widget.category == '-1') {
      response = await http.get(Uri.https('opentdb.com', '/api.php', {
        'amount': '1',
        'difficulty': widget.difficulty,
        'type': 'multiple',
      }));
    } else {
      response = await http.get(Uri.https('opentdb.com', '/api.php', {
        'amount': '1',
        'category': widget.category,
        'difficulty': widget.difficulty,
        'type': 'multiple',
      }));
    }

    var jsonDataQuestions = jsonDecode(response.body);
    questions = jsonDataQuestions['results'];
    random = [0, 1, 2, 3];
    random.shuffle();
    Options =
        [questions[0]['correct_answer']] + questions[0]['incorrect_answers'];
  }

  var Score = 0;
  int counter = 0;
  bool ans = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000814),
      appBar: AppBar(
        title: Text(
          'Here we Go!',
          style: TextStyle(
              color: Colors.grey[50], fontFamily: 'MonomaniacOne', fontSize: 28),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getQuestion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Score : $Score',
                      style: TextStyle(
                          color: Colors.grey[50],
                          fontFamily: 'MonomaniacOne',
                          fontSize: 33),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(5, 5),
                                blurRadius: 15,
                                spreadRadius: 5,
                              ),
                              BoxShadow(
                                color: Color(0xffF2DB19),
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1,
                              )
                            ]),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              questions[0]['question'],
                              // 'lol',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[50],
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (Options[random[0]] ==
                                questions[0]['correct_answer']) {
                              setState(() {
                                Score += 10;
                                counter++;
                                ans = true;

                              });
                            } else {
                              setState(() {
                                counter++;
                                ans = false;

                              });
                            }
                            if (counter.toString() == widget.amount) {
                              setScoreData(Score);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => result_page(
                                        score: Score,
                                        amount: widget.amount,
                                      )));
                            }
                          },
                            child: neumorphism(text:Options[random[0]],color: Color(0xff18CDE2), )
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            if (Options[random[1]] ==
                                questions[0]['correct_answer']) {
                              setState(() {
                                Score += 10;
                                counter++;
                                ans = true;

                              });
                            } else {
                              setState(() {
                                counter++;
                                ans = false;

                              });
                            }
                            if (counter.toString() == widget.amount) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => result_page(
                                        score: Score,
                                        amount: widget.amount,
                                      )));
                            }
                          },
                            child: neumorphism(text:Options[random[1]],color: Color(0xff18CDE2), )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (Options[random[2]] ==
                                questions[0]['correct_answer']) {
                              setState(() {
                                Score += 10;
                                counter++;
                                ans = true;

                              });
                            } else {
                              setState(() {
                                counter++;
                                ans = false;

                              });
                            }
                            if (counter.toString() == widget.amount) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => result_page(
                                        score: Score,
                                        amount: widget.amount,
                                      )));
                            }
                          },
                          child: neumorphism(text:Options[random[2]],color: Color(0xff18CDE2), )
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            if (Options[random[3]] ==
                                questions[0]['correct_answer']) {
                              setState(() {
                                Score += 10;
                                counter++;
                                ans = true;

                              });
                            } else {
                              setState(() {
                                counter++;
                                ans = false;

                              });
                            }
                            if (counter.toString() == widget.amount) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => result_page(
                                            score: Score,
                                            amount: widget.amount,
                                          )),
                                  (Route<dynamic> route) => false);
                            }
                          },
                          child: neumorphism(text:Options[random[3]],color: Color(0xff18CDE2), )
                        ),
                      ],
                    ),
                  ]),
            );
          } else {
            if (counter == 0) {
              return Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "The Battle Begins!",
                      style: TextStyle(color: Colors.grey[50], fontSize: 33, fontFamily: 'MonomaniacOne'),
                    ),
                    SizedBox(height: 60,),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else {
              if (ans) {
                return Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Woo-hoo! Right Answer',
                        style: TextStyle(color: Colors.grey[50], fontSize: 33,fontFamily: 'MonomaniacOne'),
                      ),
                      SizedBox(height: 60,),
                      CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lol Get Better",
                        style: TextStyle(color: Colors.grey[50], fontSize: 33,fontFamily: 'MonomaniacOne'),
                      ),
                      SizedBox(height: 60,),
                      CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ],
                  ),
                );
              }
            }
          }
        },
      ),
    );
  }
  Future <void> setScoreData(scoreValue) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('scoreData', scoreValue);
  }
}
