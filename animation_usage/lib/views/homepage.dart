import 'package:animation_usage/views/alphaAnimation.dart';
import 'package:animation_usage/views/multi_animation.dart';
import 'package:animation_usage/views/rotate_animation.dart';
import 'package:animation_usage/views/scaleAnimation.dart';
import 'package:animation_usage/views/translate_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Alpha Animation",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AlphaAnimation()));
                },
              ),
            ),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Scale Animation",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScaleAnimation()));
                },
              ),
            ),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Rotate Animation",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RotateAnimation()));
                },
              ),
            ),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Translate Animation",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TranslateAnimation()));
                },
              ),
            ),
            SizedBox(height: 50,width: 250,
              child: ElevatedButton(
                child: Text("Multi Animation",style: TextStyle(color : Colors.white, fontSize: 18),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MultiAnimation()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
