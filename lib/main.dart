import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() async{

  Map data = await getAllData();
  print("Result is:"+data['city']['coord']['lat'].toString());

  runApp(new MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: new Text("Weather Application"),
        backgroundColor: Colors.yellow,
      ),
      body: new Container(
        height: 800.0,
        child: new Stack(
          children: <Widget>[
            Container(
              height: 800.0,
              width: double.infinity,
              child: new Image.network("https://images.unsplash.com/photo-1575439321979-bef46fb3ca8b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80"
              ,fit: BoxFit.cover,)
            ),
            Positioned(
              bottom: 50.0,
              child: Container(
                height: 150.0,
                width: 400.0,
                margin: EdgeInsets.all(10.0),
                color: Colors.cyanAccent,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     new Text(data['list'][0]['main']['temp'].toString()+"/F",
                     style: TextStyle(color: Colors.white,
                     fontSize: 25.0),),

                     new SizedBox(height: 10.0,),
                     new Text(data['list'][0]['weather'][0]['main'],
                       style: TextStyle(color: Colors.white,
                           fontSize: 25.0),)

                   ],
                ),
              ),
            )
          ],
        ),
      ),
    )
  ));
}

Future<Map> getAllData() async {
  var api = "https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=b6907d289e10d714a6e88b30761fae22";
  var data = await http.get(api);
  var jsonData = json.decode(data.body);

  return jsonData;

}