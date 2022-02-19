import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:locationremiender/user/loginMain.dart';
import 'package:locationremiender/startup/pageOne.dart';

class PageViewStart extends StatefulWidget {
  const PageViewStart({Key? key}) : super(key: key);

  @override
  _PageViewStartState createState() => _PageViewStartState();
}

class _PageViewStartState extends State<PageViewStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/animation.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(0.0),
                ),
                color: Colors.grey[300],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: PageView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  PageOne(),
                  LoginMain(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlur({
    required Widget child,
    double sigmaX = 20,
    double sigmaY = 20,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );
}
