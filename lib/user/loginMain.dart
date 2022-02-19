import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:locationremiender/bottomnav/bottom_navigationBar.dart';
import 'package:locationremiender/user/pageThree_signup.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  _LoginMainState createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  style: GoogleFonts.roboto(
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(21.0),
                      ),
                    ),
                    hintText: "",
                    hintStyle: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF).withOpacity(0.9),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    fillColor: Color(0xffFFFFFF).withOpacity(0.2),
                    filled: true,
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Color(0xffFFFFFF).withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  style: GoogleFonts.roboto(
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(21.0),
                      ),
                    ),
                    hintText: "",
                    hintStyle: GoogleFonts.montserrat(
                        color: Color(0xffFFFFFF).withOpacity(0.9),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    fillColor: Color(0xffFFFFFF).withOpacity(0.2),
                    filled: true,
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Color(0xffFFFFFF).withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      //Navigator.of(context).push(_createRoute());
                    },
                    child: Container(
                      child: Text(
                        "Forgotten password ?",
                        style: GoogleFonts.montserrat(
                            color: Color(0xff3190FF),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_bottomNavRoute());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff000000).withOpacity(0.2),
                        blurRadius: 20.0,
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 10.0),
                      ),
                    ],
                    color: Color(0xff8460eb),
                    borderRadius: BorderRadius.all(
                      Radius.circular(26.0),
                    ),
                  ),
                  child: Text(
                    "Log In",
                    style: GoogleFonts.roboto(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(_createRoute());
                          },
                          child: Container(
                            child: Text(
                              "No account yet?",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xffFFFFFF).withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(_createRoute());
                          },
                          child: Container(
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.montserrat(
                                  color: Color(0xff3190FF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PageThreeSignUp(),
    transitionDuration: Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // ignore: unused_local_variable
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _bottomNavRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => BottomNavigation(),
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, -1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // ignore: unused_local_variable
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
