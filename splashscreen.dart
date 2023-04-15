import 'dart:async';
import 'package:bmicalculatorapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
    startTimer();
  }

  startTimer() async{
    var duration = Duration(seconds:2);
    return new Timer(duration,loginRoute);
  }

  loginRoute()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [(new Color(0xff460151)),(new Color(0xff8C01A1))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),
          Center(child: Container(
            margin: EdgeInsets.only(top:10,),
            child:Image.asset("Images/BMI.png"),
            height:250,
            width:250,
          ),)
        ],
      ),
    );
  }
}