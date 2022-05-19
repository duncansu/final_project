import 'package:flutter/material.dart';
import 'package:final_project/data.dart';

class SelectDrink extends StatelessWidget{
  Widget build(BuildContext context){
    final appBar=AppBar(title:Text('選擇飲料'),centerTitle: true,
    );

    final drinkRadioGroup=_DrinkRadioGroup(

        GlobalKey<_DrinkRadioGroupState>(),Data.drinkItem);
    final btn =RaisedButton(

      child:Text('確定'),

      onPressed:(){
        Navigator.pop(context,drinkRadioGroup.getSelectedItem());
      },
    );

    final widget=Center(
      child: Column(children:<Widget>[
        Container(child: drinkRadioGroup,width:200,margin: EdgeInsets.symmetric(vertical: 10),),
        Container(child: btn,margin: EdgeInsets.symmetric(vertical: 10),)
      ],
      ),
    );

    final page=Scaffold(appBar: appBar,body:widget);
    return page;
  }
}

class _DrinkRadioGroup extends StatefulWidget{
  final GlobalKey<_DrinkRadioGroupState>_key;

  final _drinks =const <String>['紅茶','綠茶','奶茶'];

  var _groupValue;

  _DrinkRadioGroup(this._key,this._groupValue):super (key: _key);

  State<StatefulWidget>createState()=>_DrinkRadioGroupState();

  getSelectedItem()=>_key.currentState!.getSelectedItem();
}
class _DrinkRadioGroupState extends State<_DrinkRadioGroup>{
  Widget build(BuildContext context){

    var radioItems=<RadioListTile>[];
    for(var i=0;i<widget._drinks.length;i++){
      String counter=(i*5+15).toString();
      radioItems.add(RadioListTile(value: i,groupValue: widget._groupValue,title: Text(widget._drinks[i]+counter+"元",style:TextStyle(fontSize: 20),),


        onChanged: (value){

          _update(value,widget);
        },
      )
      );
    }
    final w=Column(mainAxisAlignment: MainAxisAlignment.center,children: radioItems,);
    return w;
  }

  _update(int groupValue,_DrinkRadioGroup widget){

    setState((){
      widget._groupValue=groupValue;
      Data.drinkItem=groupValue;
    });}
  getSelectedItem()=>widget._drinks[widget._groupValue].toString();

}