import 'package:flutter/material.dart';

class WeightOnPlanet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return WeightOnPlanetState();
  }

}

class WeightOnPlanetState extends State<WeightOnPlanet>{

  int radioValue = 0;

  void handleRadioValue(int value){
    setState(() {
      radioValue = value;
      print(radioValue);
    });

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
                     controller: null,
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
                  )
                ],
              ),
            )



          ],
        )

        )
      );
  }
}