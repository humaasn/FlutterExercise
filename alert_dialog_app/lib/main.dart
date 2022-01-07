import 'package:alert_dialog_app/secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert and push'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            _showDialog(context); // _ private
          },
          child: const Text('Move the 2nd page.'),
          ),
      ),
    );
    
  }
}

// alter를 쓰기 위한 함수 만들기 
_showDialog(BuildContext context)
    {
      showDialog(
        context: context, 
        builder: (BuildContext context){
        // alterdialog() == 팝업 
        return AlertDialog(
          title: const Text('Page 이동'),
          content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions:[
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();// 팝업을 종료 후 페이지 이동 
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SecondPage();
                }));
                },
              child: const Text('Page 이동')
            ),
          ],
        );
        }
      );
    }  
