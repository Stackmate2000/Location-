import 'package:flutter/material.dart';
import 'package:locationremiender/bottomnav/floating_ActionButton.dart';
import 'package:locationremiender/homepages/home_pageOne.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationremiender/homepages/map_sample.dart';
import 'package:locationremiender/main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

  double targetValue = 24.0;
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
                color: Color(0xffF4F4F6),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: MapSample(),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //GestureDetector(onTap: () {},child: Container(child: Icon(MdiIcons.text),),),
                            Row(
                              children: [
                                Text(
                                  "Morning,",
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xff000000).withOpacity(0.7),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  "Rovira James",
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xff000000).withOpacity(0.7),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xff896ae4),
                              Color(0xff937cdc),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff000000).withOpacity(0.3),
                              blurRadius: 40.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 30.0))
                        ],
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 30.0),
                              child: Container(
                                  child: Icon(
                                MdiIcons.airballoonOutline,
                                color: Color(0xff000000).withOpacity(0.1),
                                size: 40,
                              )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 50.0, right: 50.0),
                              child: Container(
                                child: Text(
                                  "Invite your friendmates and start poking together",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FloatingAddButton(),
          ],
        ),
      ),
    );
  }
}
