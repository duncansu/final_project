import 'package:flutter/material.dart';
import 'package:final_project/data.dart';

class SelectMainCourse extends StatelessWidget{
  Widget build(BuildContext context){
    final appBar=AppBar(title:Text('選擇主餐'),centerTitle: true,
    );

    final mainCourseRadioGroup=_MainCourseRadioGroup(

      GlobalKey<_MainCourseRadioGroupState>(),Data.mainCourseItem);
    final btn =RaisedButton(

        child:Text('確定'),

        onPressed:(){
          Navigator.pop(context,mainCourseRadioGroup.getSelectedItem());
    },
    );

    final widget=Center(
      child: Column(children:<Widget>[
        Container(child: mainCourseRadioGroup,width:200,margin: EdgeInsets.symmetric(vertical: 10),),
        Container(child: btn,margin: EdgeInsets.symmetric(vertical: 10),)
        ],
      ),
    );

  final page=Scaffold(appBar: appBar,body:widget);
  return page;
  }
}

class _MainCourseRadioGroup extends StatefulWidget{
  final GlobalKey<_MainCourseRadioGroupState>_key;

  final _mainCourses =const <String>['牛肉麵','排骨飯','魚排飯'];

  var _groupValue;

  _MainCourseRadioGroup(this._key,this._groupValue):super (key: _key);

  State<StatefulWidget>createState()=>_MainCourseRadioGroupState();

  getSelectedItem()=>_key.currentState!.getSelectedItem();
}
class _MainCourseRadioGroupState extends State<_MainCourseRadioGroup>{
  Widget build(BuildContext context){

    var radioItems=<RadioListTile>[];
    for(var i=0;i<widget._mainCourses.length;i++){
      String counter=(i*10+60).toString();
      radioItems.add(RadioListTile(value: i,groupValue: widget._groupValue,title: Text(widget._mainCourses[i]+counter+'元',style:TextStyle(fontSize: 20),),


      onChanged: (value){

        _update(value,widget);
      },
      )
      );
    }
    final w=Column(mainAxisAlignment: MainAxisAlignment.center,children: radioItems,);
    return w;
  }

_update(int groupValue,_MainCourseRadioGroup widget){

  setState((){
    widget._groupValue=groupValue;
    Data.mainCourseItem=groupValue;
          }
      );
  }
  getSelectedItem()=>widget._mainCourses[widget._groupValue].toString();

        }