import 'package:flutter/material.dart';
import 'package:final_project/data.dart';

class SelectDesert extends StatelessWidget{
  Widget build(BuildContext context){
    final appBar=AppBar(title:Text('選擇甜點'),centerTitle: true,
    );

    final desertRadioGroup=_desertRadioGroup(

        GlobalKey<_desertRadioGroupState>(),Data.desert);
    final btn =RaisedButton(

      child:Text('確定'),

      onPressed:(){
        Navigator.pop(context,desertRadioGroup.getSelectedItem());
      },
    );

    final widget=Center(
      child: Column(children:<Widget>[
        Container(child: desertRadioGroup,width:200,margin: EdgeInsets.symmetric(vertical: 10),),
        Container(child: btn,margin: EdgeInsets.symmetric(vertical: 10),)
      ],
      ),
    );

    final page=Scaffold(appBar: appBar,body:widget);
    return page;
  }
}

class _desertRadioGroup extends StatefulWidget{
  final GlobalKey<_desertRadioGroupState>_key;

  final _desert =const <String>['蛋糕','冰棒','奶酪'];

  var _groupValue;

  _desertRadioGroup(this._key,this._groupValue):super (key: _key);

  State<StatefulWidget>createState()=>_desertRadioGroupState();

  getSelectedItem()=>_key.currentState!.getSelectedItem();
}
class _desertRadioGroupState extends State<_desertRadioGroup>{
  Widget build(BuildContext context){

    var radioItems=<RadioListTile>[];
    for(var i=0;i<widget._desert.length;i++){
      String counter=(i*5+15).toString();
      radioItems.add(RadioListTile(value: i,groupValue: widget._groupValue,title: Text(widget._desert[i]+counter+"元",style:TextStyle(fontSize: 20),),


        onChanged: (value){

          _update(value,widget);
        },
      )
      );
    }
    final w=Column(mainAxisAlignment: MainAxisAlignment.center,children: radioItems,);
    return w;
  }

  _update(int groupValue,_desertRadioGroup widget){

    setState((){
      widget._groupValue=groupValue;
      Data.desert=groupValue;
    });}
  getSelectedItem()=>widget._desert[widget._groupValue].toString();

}