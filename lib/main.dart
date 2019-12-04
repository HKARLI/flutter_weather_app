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
    )
  ));
}

Future<Map> getAllData() async {
  var api = "https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=b6907d289e10d714a6e88b30761fae22";
  var data = await http.get(api);
  var jsonData = json.decode(data.body);

  return jsonData;

}