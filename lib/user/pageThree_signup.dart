import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:locationremiender/user/loginMain.dart';

class PageThreeSignUp extends StatefulWidget {
  const PageThreeSignUp({Key? key}) : super(key: key);

  @override
  _PageThreeSignUpState createState() => _PageThreeSignUpState();
}

class _PageThreeSignUpState extends State<PageThreeSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_previousRoute());
                  },
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Color(0xff000000).withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                        hintText: "Your email address or phone number",
                        hintStyle: GoogleFonts.montserrat(
                            color: Color(0xffFFFFFF).withOpacity(0.9),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        fillColor: Color(0xff000000).withOpacity(0.2),
                        filled: true,
                        prefixIcon: Icon(
                          CupertinoIcons.envelope,
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
                        hintText: "Password",
                        hintStyle: GoogleFonts.montserrat(
                            color: Color(0xffFFFFFF).withOpacity(0.9),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        fillColor: Color(0xff000000).withOpacity(0.2),
                        filled: true,
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: Color(0xffFFFFFF).withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 35.0),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(_nextRoute());
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
                              offset: Offset(0.0, 10.0))
                        ],
                        color: Color(0xff8460eb),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        "Sign in",
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
                                Navigator.of(context).push(_previousRoute());
                              },
                              child: Container(
                                child: Text(
                                  "already have an account ?",
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xff000000).withOpacity(0.9),
                                      fontSize: 13,
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
                                Navigator.of(context).push(_previousRoute());
                              },
                              child: Container(
                                child: Text(
                                  "Sign Up",
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
            ),
          ),
        ],
      ),
    );
  }
}

Route _previousRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginMain(),
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
