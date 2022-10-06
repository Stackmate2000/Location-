import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locationremiender/screens/homepages/map_sample.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
            child: Stack(
              children: [
                _index == 0 ? HomeUser() : Profile(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff000000).withOpacity(0.1),
                              blurRadius: 20.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 0.0))
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Color(0xffFFFFFF),
                      ),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _index = 0;
                                  });
                                },
                                child: Container(
                                  width: 65,
                                  child: Icon(
                                    CupertinoIcons.home,
                                    color: _index == 0
                                        ? Color(0xff000000)
                                        : Color.fromARGB(255, 150, 150, 150),
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _index = 1;
                                  });
                                },
                                child: Container(
                                  width: 65,
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    color: _index == 1
                                        ? Color(0xff000000)
                                        : Color.fromARGB(255, 150, 150, 150),
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MapSample(),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
