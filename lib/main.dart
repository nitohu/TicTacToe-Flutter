import "package:flutter/material.dart";

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatefulWidget {

  @override
  State<TicTacToeApp> createState() => _TicTacToeApp();

}

class _TicTacToeApp extends State<TicTacToeApp> {

  int _activePlayer;

  Map<int, String> buttons = {};

  _TicTacToeApp() {
    for(int i = 0; i < 9; i++) {
      buttons[i] = "";
    }
  }

  Widget _buildButtons(int id) {

    return RaisedButton(
      onPressed: () {

        if(buttons[id].isEmpty) {
          setState(() {
            if(_activePlayer == 0) {
              buttons[id] = "X";
              _activePlayer = 1;
            } else {
              buttons[id] = "O";
              _activePlayer = 0;
            }
          });
        }

        
      },
      child: Text(buttons[id]),
    );

  }

  Widget _buildGameField() {
    print(buttons);
    
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildButtons(0),
            _buildButtons(1),
            _buildButtons(2)
          ],
        ),
        Row(
          children: <Widget>[
            _buildButtons(3),
            _buildButtons(4),
            _buildButtons(5)
          ],
        ),
        Row(
          children: <Widget>[
            _buildButtons(6),
            _buildButtons(7),
            _buildButtons(8)
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe")
        ),
        body:_buildGameField()
      ),
    );
  }

}