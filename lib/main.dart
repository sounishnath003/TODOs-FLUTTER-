import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Widget child;

  MyApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter ToDos',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  //final Widget child;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

// defining colors pallete
 var appColors = [Color.fromRGBO(231, 129, 109, 1.0),Color.fromRGBO(99, 138, 223, 1.0),Color.fromRGBO(111, 194, 173, 1.0)];
// card INdex
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);

  var cardList = [
    new CardItemModel("Personal", Icons.account_circle,9,0.83),
    new CardItemModel("Working", Icons.work,12,0.24),
    new CardItemModel("Home", Icons.home,7,0.35)
    ];

  // animations
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
  }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: currentColor,
        appBar: new AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search),
            ) //padding
          ], // <widgets>[]
          backgroundColor: currentColor,
          centerTitle: true,
          title: new Text(
            "TODO",
            style: new TextStyle(fontSize: 17.0),
          ),
          elevation: 0.0,
        ),
        // body
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(),
              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0,
                horizontal: 64.0),
              child: new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Icon(Icons.account_circle,size:45.0,color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                      child:  Text("Hello Sounish",
                      style: new TextStyle(fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)
                      ),
                    ),
                    new Text("Looks like feel good.")
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
      );
    }
  }



// crate a cardItem class
  class CardItemModel {
  String CardTitle;
  IconData icon;
  int tasksremaining;
  double taskCompletation;

 // creating a construction function
 CardItemModel(
   this.CardTitle,
   this.icon,
   this.tasksremaining,
   this.taskCompletation
   );
}