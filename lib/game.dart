import "package:flutter/material.dart";

class TicTacToe extends StatefulWidget {

  @override
  State<TicTacToe> createState() => _TicTacToeState(); 

}

class _TicTacToeState extends State<TicTacToe> {

  int _activePlayer = 0;
  Size _size;

  Map<int, String> buttons = {};

  List<int> player0Fields = List<int>();
  List<int> player1Fields = List<int>();

  String _displayText;

  final List< List<int> > winFields = [
    [0,4,8], [2,4,6],           // diagonal
    [0,3,6], [1,4,7], [2,5,8],  // columns
    [0,1,2], [3,4,5], [6,7,8]   //  rows
  ];

  _TicTacToeState() {
    for(int i = 0; i < 9; i++) {
      buttons[i] = "";
    }
  }

  void _resetGame() {
    setState(() {
      for(int i = 0; i < 9; i++) {
        buttons[i] = "";
      }
      
      _activePlayer = 0;
      player0Fields = [];
      player1Fields = [];
    });
  }

  void _detectWins() {

    for(List<int> wins in winFields) {
      if(player0Fields.contains(wins[0]) && player0Fields.contains(wins[1]) && player0Fields.contains(wins[2])) {
        setState(() {
          _displayText = "Player 1 has won";
          buttons[4] = "Reset";
        });
      } else if(player1Fields.contains(wins[0]) && player1Fields.contains(wins[1]) && player1Fields.contains(wins[2])) {
        setState(() {
          _displayText = "Player 2 has won";
          buttons[4] = "Reset";
        });
      }
    }

  }

  void _buttonPressed(int id) {
    if(buttons[4] == "Reset" && id == 4) {

      _resetGame();

    } else if(buttons[id].isEmpty && buttons[4] != "Reset") {
      setState(() {
        if(_activePlayer == 0) {
          buttons[id] = "X";
          _activePlayer = 1;
          player0Fields.add(id);
        } else {
          buttons[id] = "O";
          _activePlayer = 0;
          player1Fields.add(id);
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
        Text(_displayText)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    _size = MediaQuery.of(context).size;
    _displayText = "Player "+ (_activePlayer + 1).toString() +" is playing.";

    _detectWins();

    return _buildGameField();

  }

}