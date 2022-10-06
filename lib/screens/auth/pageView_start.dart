import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationremiender/screens/auth/loginMain.dart';

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
              child: LoginMain(),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Turtle",
                        style: GoogleFonts.montserrat(
                            color: Color(0xffFFFFFF),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(width: 0.0),
                      Icon(
                        CupertinoIcons.tortoise_fill,
                        size: 50,
                        color: Color(0xffFFFFFF),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "...Walk",
                        style: GoogleFonts.montserrat(
                          color: Color(0xffFFFFFF),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
