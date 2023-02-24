import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../models/globalclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  // double startscale = 0;
  // double endscale = 2 * pi;

  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 8000),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {

    timeDilation = 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Planets",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      ...planet
                          .map(
                            (e) => Column(
                              children: [
                                Hero(
                                  tag: e['tag'],
                                  child: RotationTransition(
                                    turns: animationController,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 30.0),
                                      child: Image.asset(
                                        "${e['image']}",
                                        width: 300,
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                ),
                                // TweenAnimationBuilder(
                                //     tween: Tween<double>(begin: 0, end: 2 * pi),
                                //     onEnd: () {
                                //       setState(() {
                                //         // startscale = (startscale == 0)  ? 2 * pi  : 0;
                                //         // endscale = (endscale == 2 * pi)  ? 0  : 2 * pi;
                                //       });
                                //     },
                                //     duration: Duration(seconds: 2),
                                //     builder: (context, val3, widget) {
                                //       return Transform.rotate(
                                //           angle: val3,
                                //           child: Image.asset(
                                //             "${e['image']}",
                                //             width: 320,
                                //             height: 320,
                                //           ));
                                //     }),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(context, 'HomePage1',arguments: e);
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.yellow[300],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0,
                                            right: 15,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          "${e['name']}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25,
                                              letterSpacing: 2),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
