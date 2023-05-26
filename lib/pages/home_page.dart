import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
int? scoreValue;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScore();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000814),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Trivia',
            style: TextStyle(
                color: Colors.grey[50],
                fontFamily: 'MonomaniacOne',
                fontSize: 28)),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Are You Ready?!',
                  style: TextStyle(
                      color: Colors.grey[50],
                      fontSize: 33,
                      fontFamily: 'MonomaniacOne'),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/question.jpeg'),
                radius: 80,
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                  child: Text(
                textAlign: TextAlign.center,
                'Rules of the Game\n\n'
                '\u2022 10 points for correct answer, 0 for wrong.\n'
                '\u2022 Each question has 4 options, only 1 is correct.',
                style: TextStyle(color: Colors.grey[50],fontFamily: 'Roboto',fontSize: 16),
              )),
              SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/selection');
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Text(
                    'Enter the Dungeon',
                    style: TextStyle(
                        color: Colors.grey[50], fontFamily: 'Roboto'),
                  ),
                ),
                style: TextButton.styleFrom(
                    shape: StadiumBorder(side: BorderSide(width: 1)),
                    side: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.transparent),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Previous Score : ',style: TextStyle(color:Colors.grey[50],fontFamily: 'Roboto',fontSize: 18),),
                  scoreValue == null ? Text('First time?', style: TextStyle(color: Colors.grey[50], fontFamily: 'Roboto',fontSize: 18)) : Text('$scoreValue', style: TextStyle(color: Colors.grey[50],fontFamily: 'Roboto',fontSize: 18))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void getScore() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    scoreValue = pref.getInt('scoreData');
    setState(() {

    });
  }
}

