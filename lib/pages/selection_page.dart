import 'package:flutter/material.dart';
import 'package:trivia_app/pages/difficulty_page.dart';

class selection_page extends StatelessWidget {

  const selection_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List categories = ['GK','Sports','History','Music','Anime','Mythology','Film','Tech'];
    final categoryMap = {'GK':'9','Sports':'21', 'History' : '23', 'Music' : '12', 'Anime' : '31', 'Mythology' : '20', 'Film' : '11', 'Tech': '30'};
    final List categoryImage = ['assets/gk.jpg','assets/sports.jpg','assets/history.jpg','assets/music.jpeg','assets/anime.jpeg','assets/mytho.jpeg','assets/film.jpg','assets/tech.jpeg'];
    int choice = -1;
    return Scaffold(
      backgroundColor: Color(0xff000814),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Get Started',
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 28,
            fontFamily: 'MonomaniacOne',
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Pick your Poison',
                style: TextStyle(
                    color: Colors.grey[50],
                    fontSize: 33,
                    fontFamily: 'MonomaniacOne'),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(categoryImage[index]))),
                          ),
                          Container(
                              child: TextButton(style: TextButton.styleFrom(
                                  shape: StadiumBorder(side: BorderSide(width: 1)),
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.white,
                                  )),
                            onPressed: () {
                              choice = index;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => difficulty_page(
                                    category: categoryMap[categories[index]],
                                  )));

                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                categories[index],
                                style: TextStyle(color: Colors.grey[50],fontFamily: 'Roboto'),
                              ),
                            ),
                          )),
                        ],
                      ),
                    );
                  }),
            ),
            Container(height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/allCat.jpeg')),)),
            SizedBox(height: 20,),
            Container(
                child: TextButton(style: TextButton.styleFrom(
                    shape: StadiumBorder(side: BorderSide(width: 1)),
                    side: BorderSide(
                      width: 1,
                      color: Colors.white,
                    )),
                  onPressed: () {
                    choice = 8;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => difficulty_page(
                          category: '-1',
                        )));

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Know it all !?',
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
