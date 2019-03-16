import "package:flutter/material.dart";

import "game.dart";

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe")
        ),
        body: Container(
          margin:EdgeInsets.all(10),
          child: TicTacToe()
        )
      ),
    );
  }

}