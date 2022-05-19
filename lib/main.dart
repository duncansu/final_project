import 'package:flutter/material.dart';
import 'package:final_project/select_drink.dart';
import 'package:final_project/select_main_course.dart';
import 'package:final_project/select_desert.dart';
import 'package:final_project/new main.dart';




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => My1HomePage(),
        '/a':(context) => MyHomePage(),
        '/select main course': (context) => SelectMainCourse(),
        '/select drink': (context) => SelectDrink(),
        '/select desert':(context)=>SelectDesert(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
        leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            }

        ),
        title: Text("點餐"),
        centerTitle: true,

    );

    final mainCourse = _TextWrapper(GlobalKey<_TextWrapperState>());
    final drink = _TextWrapper(GlobalKey<_TextWrapperState>());
    final desert = _TextWrapper(GlobalKey<_TextWrapperState>());

    final btnSelectMainCourse = RaisedButton(
        child: Text('選擇主餐', style: TextStyle(fontSize: 20),),
        color: Colors.yellow,
        textColor: Colors.red[500],
        elevation: 8,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        onPressed: () {
          _showMainCourseScreen(context, mainCourse);
        }
    );

    final btnSelectDrink = RaisedButton(
        child: Text('選擇飲料', style: TextStyle(fontSize: 20),),
        color: Colors.yellow,
        textColor: Colors.red[500],
        elevation: 8,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        onPressed: (){
          _showDrinkScreen(context, drink);
        }
    );
    final btnSelectdesert = RaisedButton(
        child: Text('選擇甜點', style: TextStyle(fontSize: 20),),
        color: Colors.yellow,
        textColor: Colors.red[500],
        elevation: 8,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        onPressed: (){
          _showdesertScreen(context, desert);
        }
    );

    final row1 = Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: mainCourse,
            margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
          ),),
        Container(
          child: btnSelectMainCourse,
          margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
        ),

      ],
    );

    final row2 = Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: drink,
            margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
          ),),
        Container(
          child: btnSelectDrink,
          margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
        ),
      ],
    );


    final row3 = Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: desert,
            margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
          ),),
        Container(
          child: btnSelectdesert,
          margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
        ),
      ],
    );

    final widget = Column(
      children: <Widget>[row1, row2,row3],
    );

    // 結合AppBar和App操作畫面
    final page = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return page;
  }

  _showMainCourseScreen(BuildContext context, _TextWrapper textWrapper) async {
    final result = await Navigator.pushNamed(
      context, '/select main course',);

    if (result != null) textWrapper.setText(result.toString());
    else textWrapper.setText('沒有選擇');
  }

  _showDrinkScreen(BuildContext context, _TextWrapper textWrapper) async {
    final result = await Navigator.pushNamed(
      context, '/select drink',);

    if (result != null) textWrapper.setText(result.toString());
    else textWrapper.setText('沒有選擇');
  }
  _showdesertScreen(BuildContext context, _TextWrapper textWrapper) async {
    final result = await Navigator.pushNamed(
      context, '/select desert');

    if (result != null) textWrapper.setText(result.toString());
    else textWrapper.setText('沒有選擇');
  }
}

class _TextWrapper extends StatefulWidget {
  final GlobalKey<_TextWrapperState> _key;

  _TextWrapper(this._key): super (key: _key);

  @override
  _TextWrapperState createState() => _TextWrapperState();

  setText(String text) => _key.currentState!.setText(text);
}

class _TextWrapperState extends State<_TextWrapper> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    final widget = Text(_text,
        style: TextStyle(fontSize: 20));
    return widget;
  }

  setText(String text) {
    setState(() {
      _text = text;
    });
  }
}
