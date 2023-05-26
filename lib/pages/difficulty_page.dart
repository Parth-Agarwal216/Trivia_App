import 'package:flutter/material.dart';
import 'package:trivia_app/pages/numQuestions_page.dart';

class difficulty_page extends StatefulWidget {
  var category;
  difficulty_page({
    super.key,required this.category
  });

  @override
  State<difficulty_page> createState() => _difficulty_pageState();
}

class _difficulty_pageState extends State<difficulty_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000814),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'What you got ?',
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 28,
            fontFamily: 'MonomaniacOne',
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/redSkull.jpg')),
                    color: Color(0xff000814),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: Color(0xff18CDE2),
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ]),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => numQuestions_page(
                        category: widget.category,
                            difficulty: 'easy',
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Easy',
                    style: TextStyle(color: Colors.grey[50],fontFamily: 'Roboto'),
                  ),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/loki.jpeg')),
                    color: Color(0xff000814),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: Color(0xff18CDE2),
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ]),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => numQuestions_page(
                        category: widget.category,
                            difficulty: 'medium',
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Medium',
                    style: TextStyle(color: Colors.grey[50],fontFamily: 'Roboto'),
                  ),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/thanos.jpeg')),
                    color: Color(0xff000814),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: Color(0xff18CDE2),
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ]),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => numQuestions_page(
                        category: widget.category,
                            difficulty: 'hard',
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Hard',
                    style: TextStyle(color: Colors.grey[50],fontFamily: 'Roboto'),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
//0B0B82
