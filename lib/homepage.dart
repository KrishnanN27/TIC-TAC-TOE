import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static var myFont = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.black,letterSpacing: 3));
  static var myFontWhite = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15));

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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player O',
                          style: myFontWhite,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          oScore.toString(),
                          style: myFontWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player X',
                          style: myFontWhite,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          xScore.toString(),
                          style: myFontWhite,
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
          ),
          Expanded(
            child: Container(
              child: Column(children:
              [
                Text('TIC TAC TOE',style: myFontWhite,),
                SizedBox(height: 60,),
                Text('paypal: krishnalatency@okicici',style: myFontWhite.copyWith(fontSize: 9),)
              ]),
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
