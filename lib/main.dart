import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:settings_ui/settings_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Bebas Neue',
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Open Courser'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final daysSinceEpoch = DateTime
      .now()
      .millisecondsSinceEpoch ~/ 86400000;
  bool lockInBackground = true;

  List<Widget> _cardGen(List<DateTime> dates, List<String> events) {
    List<Widget> retList = <Widget>[];
    int i = 0;
    DateTime d;
    for (d in dates) {
      retList.add(Card(
        elevation: 5.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Text('${_countDown(d)} Days till ${events[i]}',
                  style: TextStyle(fontFamily: 'Bebas Neue', fontSize: 23)),
            ],
          ),
        ),
      ));
      i = i + 1;
    }
    return retList;
  }

  List<Widget> _imgCardGen(List<String> imageList) {
    imageList.sort((b, a) => a.compareTo(b));
    List<Widget> retList = <Widget>[];
    String i;
    for (i in imageList) {
      retList.add(Card(
        elevation: 5.0,
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Stack(
            children: [Image(image: AssetImage(i))],
          ),
        ),
      ));
    }
    return retList;
  }

  Widget _genCard(String title, double cardSize, Color cardColor) {
    return Container(
        width: cardSize,
        height: cardSize,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: cardColor,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }

  int _countDown(DateTime thatDay) {
    Duration timeIn = thatDay.difference(DateTime.now());
    if (timeIn.inDays < 0) {
      thatDay = DateTime(thatDay.year + 1, thatDay.month, thatDay.day);
      timeIn = thatDay.difference(DateTime.now());
    }
    return timeIn.inDays;
  }

  Widget _homePage() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: Padding(
          //       padding: EdgeInsets.all(0.0),
          //       child: Text(
          //         'Hi, Ritesh',
          //         textAlign: TextAlign.left,
          //         style: TextStyle(
          //             fontFamily: 'Bebas Neue',
          //             fontSize: 31,
          //             fontWeight: FontWeight.w500),
          //       ),
          //     )),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  'Continue Learning',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                _genCard('Python Programming', 185, Colors.black),
                _genCard('Quantum Computing', 185, Colors.black),
              ])),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  'Featured',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                _genCard(
                    'Python Programming for Data Science', 185, Colors.black),
                _genCard('Hedge Fund Management for Babies', 185, Colors.black),
              ])),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                _genCard(
                    'Java Programming for Data Science', 185, Colors.black),
                _genCard('Personal Finance', 185, Colors.black),
              ])),
          //Text("This app is dedicated to you. ${Emoji.byName('Red Heart').char}",
          //  style: GoogleFonts.bebasNeue(fontSize: 12,), ),
        ]);
  }

  Widget _explorePage() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Align(
        //     alignment: Alignment.topCenter,
        //     child: Padding(
        //       padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        //       child: Text(
        //         'Start Learning',
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //           fontFamily: 'Bebas Neue',
        //           fontSize: 35,
        //         ),
        //       ),
        //     )),
        // TextField(
        //   decoration: InputDecoration(
        //       border: OutlineInputBorder(), hintText: 'I want to learn .....'),
        // ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                'Trending',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: Row(children: [
              _genCard(
                  'Python Programming for Data Science', 185, Colors.black),
              _genCard('Hedge Fund Management for Babies', 185, Colors.black),
            ])),
        Align(
            alignment: Alignment.centerLeft,
            child: Row(children: [
              _genCard(
                  'Python Programming for Data Science', 185, Colors.black),
              _genCard('Hedge Fund Management for Babies', 185, Colors.black),
            ])),
        Align(
            alignment: Alignment.centerLeft,
            child: Row(children: [
              _genCard(
                  'Python Programming for Data Science', 185, Colors.black),
              _genCard('Hedge Fund Management for Babies', 185, Colors.black),
            ])),
        Align(
            alignment: Alignment.centerLeft,
            child: Row(children: [
              _genCard(
                  'Python Programming for Data Science', 185, Colors.black),
              _genCard('Hedge Fund Management for Babies', 185, Colors.black),
            ]))
        // Column(
        //   children: _imgCardGen(_imgList),
        // ),
      ],
    );
  }



  List<Widget> _exploration(double textSize, List<IconData> icoList,
      List<String> opList) {
    List <Widget> wList = [];

    for(int i=0;i<opList.length;i++) {
      wList.add(Row(children: [ Align(
        alignment: Alignment.topLeft,
        child: Icon(icoList[i],
            color: Colors.deepPurple, size: textSize),
      ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
              child: Text(
                opList[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: textSize,
                ),
              ),
            ))
      ]));
    }
    return wList;
  }

  Widget _personalPage() {
    List<IconData> icoList = [Icons.person_outline, Icons.school,
      Icons.menu_book, Icons.favorite, Icons.language,
      Icons.gavel, Icons.code];

    List<String> opList = ["Profile", "Enrolled Courses", "Added Courses", "Favorites", "Language", "Terms of Service", "About Developer"];
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    'My Account',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 21,
                        fontWeight: FontWeight.w500),
                  ),
                )),
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: _exploration(27.0, icoList, opList)
                )),

            // Column(
            //   children: _imgCardGen(_imgList),
            // ),
          ],
        ));
  }

  List<Widget> _pageOptions() {
    return [_homePage(), _explorePage(), _personalPage()];
  }

  //final List<Widget> _widgetOptions = _pageOptions();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          //centerTitle: true,

          elevation: 0.0,
          backgroundColor: Colors.transparent,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
        actions: [IconButton(//onPressed: _showSearch(context: context, delegate:Search())
       icon: Icon(Icons.search, size:25, color: Colors.black,))],
        title: Text(
            'OpenCourser',
            style:GoogleFonts.patuaOne(fontSize: 25, color:Colors.black, fontWeight: FontWeight.bold),
            // TextStyle(
            //   fontFamily: 'Bebas Neue',
            //   color: Colors.black,
            //   fontWeight: FontWeight.bold,
            //   fontSize: 35,
            // ),
          ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: _pageOptions().elementAt(_selectedIndex),
          )),
      //Text("Quote of the day")

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              title: Text('Home'),
              activeIcon: Icon(Icons.home, color: Colors.deepPurple),
              //backgroundColor: Colors.grey
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, color: Colors.black),
              title: Text('Explore'),
              activeIcon: Icon(Icons.explore, color: Colors.deepPurple),
              //backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              title: Text('My Account'),
              activeIcon: Icon(Icons.person, color: Colors.deepPurple),
              //backgroundColor: Colors.blue,
            ),
          ],
          // selectedItemColor: Colors.red,
          // unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 0),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
