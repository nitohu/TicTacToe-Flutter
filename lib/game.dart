import "package:flutter/material.dart";

class TicTacToe extends StatefulWidget {

  @override
  State<TicTacToe> createState() => _TicTacToeState(); 

}

class _TicTacToeState extends State<TicTacToe> {

  int _activePlayer = 0;
  Size _size;

  Map<int, String> buttons = {};

  _TicTacToeState() {
    for(int i = 0; i < 9; i++) {
      buttons[i] = "";
    }
  }

  void _buttonPressed(int id) {
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
  }

  Widget _buildButtons(int id) {

    final double buttonWidth  = (_size.width - 40) / 3;
    final double buttonHeight = (_size.height - (50 + 160)) / 3;

    return ButtonTheme(
      minWidth: buttonWidth,
      height: buttonHeight,
      buttonColor: Colors.white,
      child: RaisedButton(
        onPressed: () => _buttonPressed(id),
        child: Text(buttons[id]),
      )
    );

  }

  Widget _buildGameField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildButtons(0),
            SizedBox(width: 10),
            _buildButtons(1),
            SizedBox(width: 10),
            _buildButtons(2)
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            _buildButtons(3),
            SizedBox(width: 10),
            _buildButtons(4),
            SizedBox(width: 10),
            _buildButtons(5)
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            _buildButtons(6),
            SizedBox(width: 10),
            _buildButtons(7),
            SizedBox(width: 10),
            _buildButtons(8)
          ],
        ),
        SizedBox(height: 10),
        Text("Player "+ (_activePlayer + 1).toString() +" is playing.")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;

    return _buildGameField();

  }

}