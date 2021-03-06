import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MenuWidget.dart';

class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState()
  => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  bool _visible = false;

  @override
  Widget build(BuildContext context)
  {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height - padding.vertical,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        "images/image1.png",
                        height: height - 90.0,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 100.0,
                        left: (width/2) - 100.0,
                        width: 200.0,
                        height: 200.0,
                        child: Image.asset("images/image2.png"),
                      ),
                      Positioned(
                        bottom: 1.0,
                        left: 15.0,
                        child: AnimatedOpacity(
                          opacity: _visible ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: _visible ? MenuWidget() : Container(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    color: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          elevation: 5.0,
                          onPressed:(){
                            setState(() {
                              _visible = !_visible;
                            });
                          } ,
                          child: Row(
                            children: <Widget>[
                              Image.asset("images/image3.png",),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                    fontSize: 20.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
