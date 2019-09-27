import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Stack(
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height,),
            Container(
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  color: Color(0XFF2F49FE),
                  padding: EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "Hello, ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextSpan(
                            text: "Ravi",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: "What can i translate for you today?, ",
                            style: TextStyle(
                                fontSize: 30, fontStyle: FontStyle.italic),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 40, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      child: Image.network(
                        "https://loremflickr.com/320/240",
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      _menuWidgets(),
                      _menuWidgets(),
                    ],
                  ),
                )
            ),
          ],
        );
      }),
    );
  }
}

Widget _menuWidgets(){
  return Container(
    height: 100,
    width: 100,
    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        border: Border.all(color: Colors.blueAccent)
    ),
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.text_fields,size: 60,),
        Text("Text",style: TextStyle(fontSize: 15),),
      ],
    ),
  );
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(0.0, size.height - (size.height / 5));
    var firstEndPoint =
        new Offset(size.width / 5, size.height - (size.height / 5));
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width / 5, size.height - (size.height / 5));
    path.lineTo(size.width - (size.width / 5), size.height - (size.height / 5));

    var secondControlPoint =
        new Offset(size.width, size.height - (size.height / 5));
    var secondEndPoint =
        new Offset(size.width, size.height - 2 * (size.height / 5));
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 2 * (size.height / 5));

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
