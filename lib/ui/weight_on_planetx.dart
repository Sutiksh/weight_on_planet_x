import 'package:flutter/material.dart';

class WeightOnPlanet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return WeightOnPlanetState();
  }

}

class WeightOnPlanetState extends State<WeightOnPlanet>{
  double _fianlResult = 0.0;
  int radioValue = 0;
  String _finalResultPlanet="";
  final TextEditingController _userWeight = new TextEditingController();
  void handleRadioValue(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _fianlResult = calculateWeight(_userWeight.text, 0.06);
          _finalResultPlanet="Pluto";
          break;
        case 1:
          _fianlResult = calculateWeight(_userWeight.text, 0.38);
          _finalResultPlanet="Mars";
          break;
          case 2:
          _fianlResult = calculateWeight(_userWeight.text, 0.91);
          _finalResultPlanet="Venus";
          break;
      }
    });

  }

  double calculateWeight(String weight, double value){
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
      return int.parse(weight) * value;
    }
    else{
      print("Wrong!!");
      return int.parse(weight)*0.38;
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X",
          style: new TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),

      backgroundColor: Colors.blueGrey,

      body: new Container(
      alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png',
            width: 200.0,
            height: 133.0,
            ),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                     controller: _userWeight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),

                  new Padding(padding: EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        new Radio<int>(
                          activeColor: Colors.white,
                            value:0, groupValue: radioValue, onChanged: handleRadioValue),
                        new Text(
                            "Pluto",
                        style: new TextStyle(color: Colors.white,fontSize: 19.5),),
                        new Radio<int>(
                            activeColor: Colors.white,
                            value:1, groupValue: radioValue, onChanged: handleRadioValue),
                        new Text(
                          "Mars",
                          style: new TextStyle(color: Colors.white,fontSize: 19.5),),
                        new Radio<int>(
                            activeColor: Colors.white,
                            value:2 , groupValue: radioValue, onChanged: handleRadioValue),
                        new Text(
                          "Venus",
                          style: new TextStyle(color: Colors.white,fontSize: 19.5),),
                    ],
                  ),
                  //Result Text
                  new Padding(padding: EdgeInsets.all(15.6)),
                  new Text("Your weight on $_finalResultPlanet is $_fianlResult",
                  style: new TextStyle(color: Colors.white,fontSize: 19.5,fontWeight: FontWeight.w500),)
                ],
              ),
            )



          ],
        )

        )
      );
  }
}
