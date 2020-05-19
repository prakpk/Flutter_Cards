import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  List<String> babies = [
    "Selecting these funds is similar to Equity Funds: \n️Portfolio that invests across diverse Sectors is Preferable\n✔️ Check on Expense Ratio and Exit Load\n✔️ Quick Check on Companies shall help\n✔️ Historic Returns",
    "Gold is considered as a safe investment. \n In time of crisis, Gold is considered among the safest investment. Allocating a definite amount of Gold in your Portfolio is a must must! ",
    "These funds are considered moderately risky in their outlook, but they should be a part of your portfolio because when the Indian Markets are in bad shape, atleast some of your investments are gaining value.",
    "Blah!",
    "Blah!"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleHomePage(
        content: babies,
      ),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
//  int index;
  List<String> content;
  ExampleHomePage({
    @required this.content,
  });

  @override
  _ExampleHomePageState createState() =>
      _ExampleHomePageState(content: content);
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  List<String> content;
  _ExampleHomePageState({@required this.content});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      backgroundColor: Color(0xFF676EE8),
      body: Column(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * .8,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05),
              child: new TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: content.length,
                  stackNum: 3,
                  swipeEdge: 0.5,
                  maxWidth: MediaQuery.of(context).size.width * 1,
                  maxHeight: MediaQuery.of(context).size.height * .7,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.height * 0.65,
//                  currentFront: myindex,
                  cardBuilder: (context, index) => Card(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        color: Colors.white,
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Container(
//                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            padding:
                                EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),

//                          child: Image.asset('${welcomeImages[index]}'),
                            child: Column(
                              children: <Widget>[
//                                Container(
//                                  child: Center(
//                                      child: Image(image: AssetImage(""))),
//                                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
//                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Center(
                                          child: Image(
                                            image: AssetImage(
                                                "assets/currency.png"),
                                            height: 60,
                                            width: 60,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 23.0),
                                      ),
                                      Center(
                                        child: Text(
                                          "${content[index]}",
                                          style: TextStyle(
                                            fontFamily: "Balsamiq Sans",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 21.5,
                                          ),
                                          softWrap: true,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                  cardController: controller = CardController(),
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                      print("left");
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                      print("right");
                    } else if (align.y > 0) {
                      print("top");
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                    print("Index: $index");
                    print("Safe area");
                  })),
          Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.1,
                      10.0,
                      MediaQuery.of(context).size.width * 0.1,
                      10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: RawMaterialButton(
                          onPressed: (null),
                          child: Text("X"),
                        ),
                      ),
                      Container(
                        child: RawMaterialButton(
                          onPressed: () {
                            setState(() {
//                              ExampleHomePage(index: 1);
                            });
                          },
                          child: Text("<-"),
                        ),
                      ),
                      Container(
                        child: RawMaterialButton(
                          onPressed: (null),
                          child: Text("->"),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
