import 'package:flutter/material.dart';
import 'SecondPage.dart';
class FirstPage extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ページ１"),
      ),
      body: Center(
        child: TextButton(
          child: Text("２ページ目に遷移する"),
          onPressed: (){
            // （1） 指定した画面に遷移する
            Navigator.push(context, MaterialPageRoute(
              // （2） 実際に表示するページ(ウィジェット)を指定する
              builder: (context) =>  SecondPage()
            ));
          },
        ),
      ),
    );
  }
}