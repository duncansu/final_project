import 'package:flutter/material.dart';
import 'package:final_project/main.dart';
import 'package:final_project/select_drink.dart';
import 'package:final_project/select_main_course.dart';
import 'package:final_project/select_desert.dart';
void main() => runApp(MynewApp());

class MynewApp extends StatelessWidget {
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
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
class My1HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('菜單'),

    );

    final btn = RaisedButton(
        child: Text('前往點餐', style: TextStyle(fontSize: 20),),
        color: Colors.white,
        textColor: Colors.black87,
        elevation: 8,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        onPressed: () {
          Navigator.popAndPushNamed(context, '/a');
        }
    );
    final btn1 = RaisedButton(
        child: Text('GOGO', style: TextStyle(fontSize: 20),),
        color: Colors.white,
        textColor: Colors.black87,
        elevation: 8,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        onPressed: () {
          Navigator.popAndPushNamed(context, '/a');
        }
    );

    // 結合AppBar和App操作畫面
    final page = Scaffold(
      appBar: AppBar(
        title: Text("菜單呈現"),
        centerTitle: true,
        actions: <Widget>[btn1],
    ),
      body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Friends('牛肉麵 60元'),
        Friends('排骨飯 70元'),
        Friends('魚排飯 80元'),
        Friends1('紅茶 15元'),
        Friends1('綠茶 20元'),
        Friends1('奶茶 25元'),
        Friends2('蛋糕 15元'),
        Friends2('冰棒 20元'),
        Friends2('奶酪 25元'),btn
      ],
    ),)
    );

    return page;



  }}
class Friends extends StatelessWidget {
  final String name;
  const Friends(this.name);

  @override
  Widget build(BuildContext context){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.purple,
        border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.purple)
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 414,
        height: 70,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
class Friends1 extends StatelessWidget {
  final String name;
  const Friends1(this.name);

  @override
  Widget build(BuildContext context){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFFF355d5c),
        border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFFFF355d5c))
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 414,
        height: 70,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
class Friends2 extends StatelessWidget {
  final String name;
  const Friends2(this.name);

  @override
  Widget build(BuildContext context){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.amberAccent)
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 414,
        height: 70,
        child: Text(
          name,
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}