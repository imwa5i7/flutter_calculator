import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator_brain.dart';
class Screen extends StatefulWidget{
  @override
  _ScreenState createState()=> _ScreenState();
}

class _ScreenState extends State<Screen>{
  String expression;
  double result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _expressionArea(),
        _resultArea(),
        _buttonsArea(),
      ],
    );
  }

  //Expression Area
  _expressionArea() {
    return Text(
      expression?? '',
      style: TextStyle(color: Colors.grey[700], fontSize: 22),
    );
  }

  //Result Area
  _resultArea() {
    return Text(
      result == null ? '' : result.toString(),
      style: TextStyle(color: Colors.grey[700], fontSize: 50),
    );
  }

  //Buttons area
  _buttonsArea() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //first row of buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _signButton(text: "+"),
                      _signButton(text: "-"),
                      _signButton(text: "x"),
                      _signButton(text: "/")
                    ],
                  ),
                  //2nd row of numbers and Clear
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _numberButton(text: "7"),
                        _numberButton(text: "8"),
                        _numberButton(text: "9"),
                        _cleanButton(text: "C"),
                      ],
                    ),
                  ),
                  //final 3 row buttons
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _numberButton(text: "4"),
                            _numberButton(text: "1"),
                            _numberButton(text: "0"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _numberButton(text: "5"),
                            _numberButton(text: "2"),
                            _numberButton(text: "."),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _numberButton(text: "6"),
                            _numberButton(text: "3"),
                            _backButton(text: "<="),
                          ],
                        ),

                        _greenStretchButton(),

                      ],
                    ),
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //sign buttons for plus/minus/divide/multiply
  _signButton({text}) {
    return Container(
      width: 70,
      height: 70,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue[500],fontSize: 48,
          ) ,
        ),
        color: Colors.blue[100],
        shape: CircleBorder(),
        splashColor: Colors.blue,
        onPressed: (){
          setState(() {
            expression= '$expression$text';
          });

        },
      ),
    );
  }
  _numberButton({text}) {
    return Container(
      width: 70,
      height: 70,
      child: MaterialButton(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[500],fontSize: 48,
            ) ,
          ),
        ),
        color: Colors.grey[100],
        shape: CircleBorder(),
        splashColor: Colors.grey,
        onPressed: (){
          setState(() {
            if(expression != null){
              expression='$expression$text';
            }
            else{
              expression=text;
            }
            print(expression);
          });

        },
      ),
    );
  }
  _cleanButton({text}) {
    return Container(
      width: 70,
      height: 70,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.red[500],fontSize: 48,
          ) ,
        ),
        color: Colors.red[100],
        shape: CircleBorder(),
        splashColor: Colors.red,
        onPressed: (){
          setState(() {
            expression='';
            result=null;
          });

        },
      ),
    );
  }
  _backButton({text}) {
    return Container(
      width: 70,
      height: 70,
      child: MaterialButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.orange[500],fontSize:32,
          ) ,
        ),
        color: Colors.orange[100],
        shape: CircleBorder(),
        splashColor: Colors.orange,
        onPressed: (){
          setState(() {
            if (expression != null && expression.length > 0) {
              setState(() {
                expression = expression.substring(0, expression.length - 1);
              });
            }
          });

        },
      ),
    );
  }


  _greenStretchButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15,bottom: 15),
      child: GestureDetector(
        onTap: (){
          setState(() {
            final resultVal= CalculatorBrain.evaluateExpression(expression);
            result=resultVal;
          });

        },

        child: Container(
          width: 70,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.lightGreen[100], borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Text(
              '=',
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 48,),
            ),
          ),
        ),
      ),
    );
  }


}