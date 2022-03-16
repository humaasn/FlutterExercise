import 'dart:async';
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
  int _cur = 0;
  late double pageOffset;

  // ignore: prefer_final_fields
  PageController _controller = PageController(initialPage: 0, viewportFraction: 0.7);
  

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_cur < 2) {
        _cur++;
      } else {
        _cur = 0;
      }

      _controller.animateToPage(
        _cur,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Test App"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width:300,
              height: 400,
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/json/test.json'),
          builder: (context, snapshot) {
          // Decode the JSON
          var new_data = json.decode(snapshot.data.toString());
    
        return PageView.builder(
          controller: _controller,
          onPageChanged: (num) {
            setState(() {
              _cur = num;
              print(_cur);
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 200,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 30
                ),
                child: Image.network(new_data[index]['url']),
              ),

            );
          },
          itemCount: new_data == null ? 0 : new_data.length,
          
        );
          }
      ),
      ),
      Row(children: [
        IconButton(
          onPressed: (){
            setState(() {
              _controller.previousPage(duration: Duration(milliseconds: 0), curve: Curves.ease);
            });
          }, 
          icon: Icon(Icons.arrow_back)
          ),

          IconButton(
          onPressed: (){
            setState(() {
              _controller.nextPage(duration: Duration(milliseconds: 1), curve: Curves.ease);
              
            });
          }, 
          icon: Icon(Icons.arrow_forward_ios_outlined)
          ),

          
      ],)

          ],

        ),
      )
    );
  }
}
