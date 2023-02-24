import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1>
  with TickerProviderStateMixin{

  late AnimationController animationController1;
  late AnimationController animationController2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 8000),
    );

    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    animationController1.repeat();
    animationController2.repeat();
  }

  @override
  Widget build(BuildContext context) {

    Map details = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: details['tag'],
                child: RotationTransition(
                    turns: animationController2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("${details['image']}",height: 30,),
                    )),
              ),
              Text(
                "${details['name']}",
                style: TextStyle(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: 350,
                    child: Hero(
                      tag: details['tag'],
                      child: RotationTransition(
                          turns: animationController1,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset("${details['image']}"),
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0,left: 20,right: 20),
              child: Card(
                elevation: 5,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text("Detail",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),),
                        ),
                        SizedBox(height: 15,),
                        Text("${details['detail']}",style: TextStyle(fontSize: 17),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
