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
      return Center(
        child: Container(
           child: new Text("hello Sounish"),
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