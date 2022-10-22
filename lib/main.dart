import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTurn = true;
  List displayEx0h = [
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

  int oScore = 0, xScore = 0, filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: Container(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player O',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          oScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player X',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          xScore.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Center(
                        child: Text(
                          displayEx0h[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  void _tapped(int index) {

    setState(() {
      if (onTurn && displayEx0h[index] == '') {
        displayEx0h[index] = 'o';
            filledBoxes +=1;

      } else if (!onTurn && displayEx0h[index] == '') {
        displayEx0h[index] = 'x';
       filledBoxes +=1;

        

      }
      onTurn = !onTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //check first row
    if (displayEx0h[0] == displayEx0h[1] &&
        displayEx0h[0] == displayEx0h[2] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }  if (displayEx0h[3] == displayEx0h[4] &&
        displayEx0h[3] == displayEx0h[5] &&
        displayEx0h[3] != '') {
      _showWinDialog(displayEx0h[3]);
    }  if (displayEx0h[6] == displayEx0h[7] &&
        displayEx0h[6] == displayEx0h[8] &&
        displayEx0h[6] != '') {
      _showWinDialog(displayEx0h[6]);
    }  if (displayEx0h[0] == displayEx0h[3] &&
        displayEx0h[0] == displayEx0h[6] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    }  if (displayEx0h[1] == displayEx0h[4] &&
        displayEx0h[1] == displayEx0h[7] &&
        displayEx0h[1] != '') {
      _showWinDialog(displayEx0h[1]);
    }  if (displayEx0h[2] == displayEx0h[5] &&
        displayEx0h[2] == displayEx0h[8] &&
        displayEx0h[2] != '') {
      _showWinDialog(displayEx0h[2]);
    }  if (displayEx0h[6] == displayEx0h[4] &&
        displayEx0h[6] == displayEx0h[2] &&
        displayEx0h[6] != '') {
      _showWinDialog(displayEx0h[6]);
    }  if (displayEx0h[0] == displayEx0h[4] &&
        displayEx0h[0] == displayEx0h[8] &&
        displayEx0h[0] != '') {
      _showWinDialog(displayEx0h[0]);
    } else if(filledBoxes == 9){
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is : ' + winner),
            actions: [
              TextButton(onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('Play Again'),)
            ],
          );
        });

        if(winner == 'o'){
          oScore +=1;
    
        }else if(winner == 'x'){
          xScore += 1;
        }
  }

void _clearBoard() {

  setState(() {
    for(int i=0; i<9; i++){
    displayEx0h[i] = '';
  }
  });

  filledBoxes = 0;

}

  void _showDrawDialog() {
       showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: [
              TextButton(onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('Play Again'),)
            ],
          );
        });

  }
}
