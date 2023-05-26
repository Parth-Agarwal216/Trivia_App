import 'package:flutter/material.dart';

class result_page extends StatelessWidget {
  var score;
  var amount;
  result_page({super.key,
    required this.score,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000814),
      appBar: AppBar(backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'And your score is...',
          style: TextStyle(
              fontFamily: 'MonomaniacOne', fontSize: 28, color: Colors.grey[50]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 200,
              width: 200,
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
                      color: Color(0xff10FB20),
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
                    '$score/${10*int.parse(amount)}',
                    style: TextStyle(fontSize: 60,
                        color: Colors.grey[50],
                        fontFamily: 'MonomaniacOne'),
                  ),
                ),
              ),
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
                    Navigator.of(context).pushNamedAndRemoveUntil('/',(Route<dynamic> route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Play Again ?',
                      style: TextStyle(color: Colors.grey[50],fontFamily: 'Roboto'),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
