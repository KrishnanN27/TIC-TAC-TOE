import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/homepage.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin{

  static var myFont = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.black,letterSpacing: 3));
  static var myFontWhite = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white,letterSpacing: 3));


  @override
  Widget build(BuildContext context) {

    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  home: Scaffold(
      backgroundColor: Colors.grey[800],
  body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
  child: Padding(
      padding:  const EdgeInsets.only(top: 120),
  child: Container(
      child: Text('TIC TAC TOE',style: myFontWhite.copyWith(fontSize: 30),),
      ),
      )),
    Expanded(child: Container(
      child: AvatarGlow(
        endRadius: 140,
        duration: Duration(seconds: 2),
        glowColor: Colors.white,
        repeat: true,
        repeatPauseDuration: Duration(seconds: 1),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.none),
            shape: BoxShape.circle
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: Container(
              child: Image.asset('lib/images/tic.png',fit: BoxFit.scaleDown,),

            ),
            radius: 80,
          ),
        ),
      ),
    )),
    Expanded(child: Padding(
      padding: EdgeInsets.only(top: 80),
      child: Text('@CREATEDBYKRISHNA',style: myFontWhite.copyWith(fontSize: 18),),
    )),
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 40,right: 40,bottom: 60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(30),
            color: Colors.white,
            child: Center(
              child: Text('PLAY GAME',style: myFont,),
            ),
          ),
        ),
      ),
    )
  ],
      ),
      ),
      ),
      );
  }
}

