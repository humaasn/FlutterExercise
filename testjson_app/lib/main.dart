import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testjson_app/model.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var dataJson = await rootBundle.loadString("assets/json/test.json");
    var decodeData = jsonDecode(dataJson);
    var productData = decodeData["images"];

    Data.items = List.from(productData)
        .map<Item>((item) => Item.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Test App"),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            //reverse: true,
            scrollDirection: Axis.horizontal,
            //enableInfiniteScroll: false,
            //viewportFraction: 0.33,
            onPageChanged: (index, reason){
              _currentIndex = index;
            }
          ),
          items: Data.items.map((item) => Container(
            width: 300.0,
            height: 300.0,
            child: Image.network(item.url,
              width: 200,
              height: 300,
            )
          )).toList(),
        ),
      ),
    );
  }
}
