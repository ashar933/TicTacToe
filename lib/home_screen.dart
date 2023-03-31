import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tictactoe/constants.dart';
import 'alert_dialog.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnOfO = true;
  int _filledBoxes = 0;
  final List<String> _xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _clearBoard();
            },
          )
        ],
        title: Text(
          'Tic Tac Toe',
          style: kCustomText(
              fontSize: 20.0, color: Color.fromARGB(255, 254, 254, 254), fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 60, 56, 56),
      body: Column(
        children: [
          _buildPointsTable(),
          _buildGrid(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _buildPointsTable() {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Player O',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Color.fromARGB(255, 48, 152, 255),
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _scoreO.toString(),
                    style: kCustomText(
                        color: Color.fromARGB(255, 90, 255, 112),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Player X',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Color.fromARGB(255, 255, 70, 70),
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _scoreX.toString(),
                    style: kCustomText(
                        color: Color.fromARGB(255, 90, 255, 112),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Color.fromARGB(255, 169, 139, 139))),
                child: Center(
                  child: Text(
                    _xOrOList[index],
                    style: TextStyle(
                      color:
                          _xOrOList[index] == 'x' ? Color.fromARGB(255, 255, 70, 70) : Color.fromARGB(255, 48, 152, 255),
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildTurn() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
          child: Text(
            _turnOfO ? "O's Turn" : "X's Turn",
            style: kCustomText(color: _turnOfO ?Colors.blueAccent : Colors.redAccent),
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = 'o';
        _filledBoxes += 1;
      } else if (!_turnOfO && _xOrOList[index] == '') {
        _xOrOList[index] = 'x';
        _filledBoxes += 1;
      }

      _turnOfO = !_turnOfO;
      _checkTheWinner();
    });
  }

  void _checkTheWinner() {
    // check first row
    if (_xOrOList[0] == _xOrOList[1] &&
        _xOrOList[0] == _xOrOList[2] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second row
    if (_xOrOList[3] == _xOrOList[4] &&
        _xOrOList[3] == _xOrOList[5] &&
        _xOrOList[3] != '') {
      _showAlertDialog('Winner', _xOrOList[3]);
      return;
    }

    // check third row
    if (_xOrOList[6] == _xOrOList[7] &&
        _xOrOList[6] == _xOrOList[8] &&
        _xOrOList[6] != '') {
      _showAlertDialog('Winner', _xOrOList[6]);
      return;
    }

    // check first column
    if (_xOrOList[0] == _xOrOList[3] &&
        _xOrOList[0] == _xOrOList[6] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check second column
    if (_xOrOList[1] == _xOrOList[4] &&
        _xOrOList[1] == _xOrOList[7] &&
        _xOrOList[1] != '') {
      _showAlertDialog('Winner', _xOrOList[1]);
      return;
    }

    // check third column
    if (_xOrOList[2] == _xOrOList[5] &&
        _xOrOList[2] == _xOrOList[8] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    // check diagonal
    if (_xOrOList[0] == _xOrOList[4] &&
        _xOrOList[0] == _xOrOList[8] &&
        _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }

    // check diagonal
    if (_xOrOList[2] == _xOrOList[4] &&
        _xOrOList[2] == _xOrOList[6] &&
        _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }

    if (_filledBoxes == 9) {
      _showAlertDialog('Draw', '');
    }
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}',
        defaultActionText: 'OK',
        onOkPressed: () {
          _clearBoard();
          Navigator.of(context).pop();
        });

    if (winner == 'o') {
      _scoreO += 1;
    } else if (winner == 'x') {
      _scoreX += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        _xOrOList[i] = '';
      }
    });

    _filledBoxes = 0;
  }
}