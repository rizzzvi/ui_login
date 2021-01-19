import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_login/login_page.dart';
import 'package:ui_login/signup_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> imgList = [
    {
      'image': 'assets/images/people.png',
      'title': 'Meet People',
      'desc': 'You will get to meet a lot of new people',
      'index': 0,
    },
    {
      'image': 'assets/images/chat.png',
      'title': 'Chatting',
      'desc': 'You can chat with thousands of people',
      'index': 1,
    },
    {
      'image': 'assets/images/meet.png',
      'title': 'Make Groups',
      'desc': 'You can make groups with people you like',
      'index': 2,
    },
  ];
  Color _backgroundColor = Colors.green;
  Color _buttonTextColor = Colors.green;

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: CarouselSlider(
                items: imgList
                    .map(
                      (item) => Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          top: 48,
                          bottom: 24,
                        ),
                        color: item['index'] == 0
                            ? Colors.green
                            : item['index'] == 1
                                ? Colors.purple
                                : Colors.yellow[900],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                child: Image.asset(
                                  item['image'],
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                item['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              item['desc'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList.map(
                                (dir) {
                                  int index = imgList.indexOf(dir);
                                  return Container(
                                    width: 72.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 12.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(12),
                                      color: _current == index
                                          ? Colors.white
                                          : Color.fromRGBO(0, 0, 0, 0.4),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.75,
                  autoPlay: true,
                  autoPlayInterval: Duration(
                    seconds: 3,
                  ),
                  autoPlayAnimationDuration: Duration(
                    microseconds: 800,
                  ),
                  autoPlayCurve: Curves.bounceInOut,
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                      _backgroundColor = index == 0
                          ? Colors.green
                          : index == 1
                              ? Colors.purple
                              : Colors.yellow[900];
                      _buttonTextColor = index == 0
                          ? Colors.green[800]
                          : index == 1
                              ? Colors.purple[800]
                              : Colors.yellow[900];
                    });
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                elevation: 8.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
                },
                child: Text(
                  'SIGNUP',
                  style: TextStyle(
                    fontSize: 18,
                    color: _buttonTextColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
