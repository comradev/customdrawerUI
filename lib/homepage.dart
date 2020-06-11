import 'package:flutter/material.dart';
import 'pagecontents.dart';
import 'package:intl/intl.dart';
import 'dart:math';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: 'BlueYellow',
      home: CustomDrawer(),

    );
  }
}
class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() => new CustomDrawerState();
}

class CustomDrawerState extends State < CustomDrawer > with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  var pi = 3.1415926;
  var f = new NumberFormat("0000", "en_US");
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  void toggle() => animationController.isDismissed ?
    animationController.forward() :
    animationController.reverse();


  var maxSlide = 290.0;
  Widget build(BuildContext context) {
    var myBackground = Container(color: Color(0xffABA396));
    var myDrawer = Container(child: SideBar(), );
    var myChild = Container(child: PurchasePage(), );
    return
    GestureDetector(
      onTap: () {
        toggle();
      },
      child:
      AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Stack(
            children: < Widget > [
              myBackground,
              Transform.translate(
                offset: Offset((-MediaQuery.of(context).size.width) + maxSlide * animationController.value, 0),
                child:
                Transform(
                  transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY((pi / 2) * (1 - animationController.value)),
                  alignment: Alignment.centerRight,
                  child: myDrawer,
                )
              ),
              Transform.translate(
                offset: Offset(maxSlide * animationController.value, 0),
                child:
                Transform(
                  transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(-pi / 2 * animationController.value),
                  alignment: Alignment.centerLeft,
                  child: myChild,
                )
              ),
              
              Padding(
                padding: EdgeInsets.only(top: 54, left:25+(animationController.value*300)), 
                child: Icon(Icons.menu, color: Color(0xff595449), ),
              ),
              Container(
              padding: EdgeInsets.only(top: 90, bottom:60,),

              child: Center(child: Image.asset('lib/images/tr2/a${f.format((pow(animationController.value,0.6)*40).floor())}.png', height: 900, gaplessPlayback: true,))),
            ],
          );
        },
      )
    );


  }
}


/*
class _CustomDrawerState extends State < CustomDrawer > {
  final double maxSlide = 225.0;
  @override
  Widget build(BuildContext context) {
    var myDrawer = Container(color: Colors.blue);
    var myChild = Container(color: Colors.yellow);
    return Stack(children: < Widget > [
      myDrawer,
      Transform(
        transform: Matrix4.identity()
          ..translate(maxSlide)
          ..scale(0.5),
          
        alignment: Alignment.centerLeft,
        child:myChild,
      )
    ], );
  }
}
*/