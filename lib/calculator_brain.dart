import 'package:math_expressions/math_expressions.dart';
class CalculatorBrain{

  static evaluateExpression(inputExp){

    // Parse String expression into a math expression
    Parser p = Parser();
    Expression exp = p.parse(inputExp);
    print(exp.toString());

    // @Todo: Validate if the expression is valid or not.


    // Evaluate expression for answer
    try{
      double ans = exp.evaluate(EvaluationType.REAL, ContextModel());
      print(ans);
      return ans;
    }catch(e){
      print('Exception @Evaluat: $e');
    }
  }



}