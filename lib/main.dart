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
        fontFamily: 'product sans',
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

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
                      child:  Text("Hello Sounish.",
                      style: new TextStyle(fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)
                      ),
                    ),
                    new Text("Looks like feel good.",
                    style: new TextStyle(
                      color: Colors.white
                    ),
                    ),
                    new Text(
                      "You have 3 tasks to do today.",
                      style: new TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0,
                    vertical: 16.0),
                    child: new Text("TODAY : MAR 17, 2019",
                    style: new TextStyle(color: Colors.white),
                  ),
                  ),

                  new Container(
                    height: 350.0,
                    child: ListView.builder(
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int position) {
                      return GestureDetector(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: new Card(
                           child: new Container(
                             width: 262.0,
                             child: new Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                 new Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: new Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: <Widget>[
                                       Icon(cardList[position].icon,
                                       color: appColors[position],
                                       size: 38.0,
                                       ),
                                       Icon(Icons.more_vert,color: Colors.black),
                                     ],
                                   ),
                                 ),

                                 new Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: new Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       new Padding(
                                         padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                                         child: new Text(
                                           "${cardList[position].tasksremaining} Tasks",
                                           style: TextStyle(color: Colors.black),
                                         ),
                                       ),
                                       new Padding(
                                         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                         child: new Text("${cardList[position].CardTitle}",
                                         style: new TextStyle(fontSize: 28.0),
                                         ),
                                       ),
                                       new Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: LinearProgressIndicator(value: cardList[position].taskCompletation,),
                                       ),
                                     ], // widget end
                                   ),
                                 ),
                               ],
                             ),
                           ),

                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.0),
                           ),
                         ),
                       ),
                       onHorizontalDragEnd: (details) {

                          animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
                          curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
                          animationController.addListener(() {
                            setState(() {
                              currentColor = colorTween.evaluate(curvedAnimation);
                            });
                          });

                          if(details.velocity.pixelsPerSecond.dx > 0) {
                            if(cardIndex>0) {
                              cardIndex--;
                              colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
                            }
                          }else {
                            if(cardIndex<2) {
                              cardIndex++;
                              colorTween = ColorTween(begin: currentColor,
                                  end: appColors[cardIndex]);
                            }
                          }
                          setState(() {
                            scrollController.animateTo((cardIndex)*256.0, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
                          });

                          colorTween.animate(curvedAnimation);

                          animationController.forward( );

                        }, // horixontal
                      ) ;
                     },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(),
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