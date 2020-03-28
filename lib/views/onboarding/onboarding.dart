import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate/utils/constant.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final int _numberPages = 3;
  int _currentPage = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 14.0,
      width: isActive ? 22.0 : 14.0,
      decoration: BoxDecoration(
        color: isActive ? kprimary : Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numberPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 650.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 400.0,
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/img/page3.jpg"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Discover',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2),
                                    ),
                                    Text(
                                      ' the best Property',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15.0,
                                      height: 1.3,
                                      letterSpacing: 1.4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 400.0,
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/img/page2.jpg"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Discover',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2),
                                    ),
                                    Text(
                                      ' the best Property',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15.0,
                                      height: 1.3,
                                      letterSpacing: 1.4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 400.0,
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/img/page1.jpg"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Discover',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2),
                                    ),
                                    Text(
                                      ' the best Property',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15.0,
                                      height: 1.3,
                                      letterSpacing: 1.4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numberPages - 1
          ? GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/wrapper"),
              child: Container(
                  height: 100.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: kprimary,
                  ),
                  child: Center(
                      child: Text(
                    "Get started",
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 24.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
            )
          : Text(''),
    );
  }
}
