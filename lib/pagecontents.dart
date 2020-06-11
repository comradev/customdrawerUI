import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
class PurchasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Testing',
      home: new Scaffold(
        backgroundColor: Color(0xffECE3D3),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
              child: MySpecialAppBar(),
          ),
        ),
        body: Stack(
          children: < Widget > [
            Container(
              margin: const EdgeInsets.only(top: 220, ),
                child: Stack(
                  children: < Widget > [
                    new RotationTransition(
                      alignment: Alignment(-0.2, -0.9),
                      turns: new AlwaysStoppedAnimation(90 / 360),
                      child: new Text(
                        'FENDER',
                        style: GoogleFonts.exo2(
                          textStyle:
                          Theme.of(context).textTheme.headline4,
                          color: Color(0xffBEB4A8),
                          fontWeight: FontWeight.bold,
                          fontSize: 100,
                        ),
                      ),
                    ),


                  ], ),
            ),
            Container(
              child: Center(child: Image.asset('lib/images/shadow.png', height: 650,))),
          ],
        )
      ),

    );
  }
}







class MySpecialAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Color(0xffECE3D3),
      elevation: 0.0,
      centerTitle: true,
      title:
      Text(
        'PRODUCT DETAIL',
        style: GoogleFonts.titilliumWeb(
          textStyle:
          Theme.of(context).textTheme.headline4,
          color: Color(0xff595449),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}


class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: 'Testing',
      home: new Scaffold(

        backgroundColor: Color(0xffECE3D3),

        body: Container(
          padding: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(border: Border(right: BorderSide( //                   <--- left side
            color: Colors.white,
            width: 3.0,
          ), ), ),
          child: Container(

            margin: const EdgeInsets.only(top: 0, left: 00, ),
              child:
              Stack(children: < Widget > [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 140, ),
                    child: Image.asset('lib/images/yamaha.png', height: 55, ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 140, ),
                    child: ListView(
                      children: < Widget > [
                        CategoryTile(param: "GUITARS", isActive: true, ),
                        CategoryTile(param: "BASSES", isActive: false, ),
                        CategoryTile(param: "AMPS", isActive: false, ),
                        CategoryTile(param: "PEDALS", isActive: false, ),
                        CategoryTile(param: "OTHERS", isActive: false, ),
                      ]
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 590, left: 160, ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: < Widget > [
                        CategoryTileSmall(param: "ABOUT"),
                        CategoryTileSmall(param: "SUPPORT"),
                        CategoryTileSmall(param: "TERMS"),
                        CategoryTileSmall(param: "FAQS"),
                      ], )
                ),
              ], )
          ),
        )),

    );
  }
}
class CategoryTile extends StatelessWidget {
  CategoryTile({
    Key key,
    this.param,
    this.isActive
  }): super(key: key);
  final bool isActive;
  final String param;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(param,
        style: GoogleFonts.exo2(
          textStyle:
          Theme.of(context).textTheme.headline4,
          color: isActive ? Color(0xff955F52) : Color(0xff221D19),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ), ),
    );
  }
}


class CategoryTileSmall extends StatelessWidget {
  CategoryTileSmall({
    Key key,
    this.param,
  }): super(key: key);
  final String param;
  @override
  Widget build(BuildContext context) {
    return Text(param,
      style: GoogleFonts.exo2(
        textStyle: new TextStyle(
          color: Color(0xff221D19),
          fontWeight: FontWeight.bold,
          fontSize: 15,
          height: 2.0)
      ),
    );
  }
}