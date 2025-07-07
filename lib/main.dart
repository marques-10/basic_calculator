import 'dart:io';

import 'package:basic_calculator/src/components/BuildAppBar.dart';
import 'package:basic_calculator/src/components/BuildNumbers.dart';
import 'package:basic_calculator/src/components/BuildOperators.dart';
import 'package:basic_calculator/src/utils/AppColors.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.background2),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayValue = '0';
  String lastDisplayValue = '0';
  String currentValue = '0';
  List currentOperation = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 32,
        centerTitle: false,
        backgroundColor: AppColors.background,
        title: const BuildAppbar(),
      ),
      body: Container(
        color: AppColors.background,
        child: Column(
          children: [
            // Display Result
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                // color: AppColors.background,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  lastDisplayValue == '0'
                      ? ''
                      : lastDisplayValue.replaceAll('.', ','),
                  style: TextStyle(
                    color: AppColors.buttonLight,
                    fontSize: (Platform.isIOS || Platform.isAndroid) ? 42 : 22,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Display
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                // color: AppColors.background,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 7, left: 7),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    displayValue.replaceAll('.', ','),
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: setSizeDisplay(),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Teclado
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: SizedBox(
                  width: double.infinity,
                  // color: AppColors.background,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              displayValue == '0' || lastDisplayValue != '0'
                                  ? Buildoperators(
                                      operator: 'AC',
                                      onTap: () {
                                        print('AC');
                                        setOperator('AC');
                                      },
                                    )
                                  : Buildoperators(
                                      operator: 'RM',
                                      icon: FontAwesomeIcons.deleteLeft,
                                      onTap: () {
                                        print('RM');
                                        setOperator('RM');
                                      },
                                      onLongPress: () {
                                        clearCalculator();
                                      },
                                    ),
                              Buildoperators(
                                operator: '+/-',
                                onTap: () {
                                  setOperator('+/-');
                                  print('+/-');
                                },
                                fontWeight: FontWeight.w200,
                              ),
                              Buildoperators(
                                operator: '%',
                                fontSize: 18,
                                fontWeight: FontWeight.w200,
                                onTap: () {
                                  setOperator('%');
                                  print('%');
                                },
                              ),
                              Buildoperators(
                                operator: '÷',
                                fontSize: 26,
                                fontWeight: FontWeight.w200,
                                backgroundColor: AppColors.operator,
                                onTap: () {
                                  setOperator('÷');
                                  print('÷');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Buildnumbers(
                                number: '7',
                                onTap: () {
                                  print('7');
                                  setNumber('7');
                                },
                              ),
                              Buildnumbers(
                                number: '8',
                                onTap: () {
                                  print('8');
                                  setNumber('8');
                                },
                              ),
                              Buildnumbers(
                                number: '9',
                                onTap: () {
                                  print('9');
                                  setNumber('9');
                                },
                              ),
                              Buildoperators(
                                operator: 'X',
                                icon: FontAwesomeIcons.xmark,
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                backgroundColor: AppColors.operator,
                                onTap: () {
                                  setOperator('x');
                                  print('X');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Buildnumbers(
                                number: '4',
                                onTap: () {
                                  print('4');
                                  setNumber('4');
                                },
                              ),
                              Buildnumbers(
                                number: '5',
                                onTap: () {
                                  print('5');
                                  setNumber('5');
                                },
                              ),
                              Buildnumbers(
                                number: '6',
                                onTap: () {
                                  print('6');
                                  setNumber('6');
                                },
                              ),
                              Buildoperators(
                                operator: '-',
                                icon: FontAwesomeIcons.minus,
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                backgroundColor: AppColors.operator,
                                onTap: () {
                                  setOperator('-');
                                  print('-');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Buildnumbers(
                                number: '1',
                                onTap: () {
                                  print('1');
                                  setNumber('1');
                                },
                              ),
                              Buildnumbers(
                                number: '2',
                                onTap: () {
                                  print('2');
                                  setNumber('2');
                                },
                              ),
                              Buildnumbers(
                                number: '3',
                                onTap: () {
                                  print('3');
                                  setNumber('3');
                                },
                              ),
                              Buildoperators(
                                operator: '+',
                                icon: FontAwesomeIcons.plus,
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                backgroundColor: AppColors.operator,
                                onTap: () {
                                  print('+');
                                  setOperator('+');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Buildoperators(
                                operator: 'calc',
                                icon: FontAwesomeIcons.calculator,
                                backgroundColor: AppColors.buttonDark,
                                onTap: () {
                                  print('calc');
                                },
                              ),
                              Buildnumbers(
                                number: '0',
                                onTap: () {
                                  print('0');
                                  setNumber('0');
                                },
                              ),
                              Buildnumbers(
                                number: ',',
                                onTap: () {
                                  print(',');
                                  setNumber(',');
                                },
                              ),
                              Buildoperators(
                                operator: '=',
                                icon: FontAwesomeIcons.equals,
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                backgroundColor: AppColors.operator,
                                onTap: () {
                                  setOperator('=');
                                  print('=');
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDisplayValue() {
    if (displayValue == '0') {
      return displayValue;
    } else {
      return currentOperation.join();
    }
  }

  void clearCalculator() {
    setState(() {
      displayValue = '0';
      lastDisplayValue = '0';
      currentValue = '0';
      currentOperation = [];
    });
  }

  double setSizeDisplay() {
    switch (displayValue.length) {
      case > 12:
        return (Platform.isIOS || Platform.isAndroid) ? 46 : 23;
      case > 11:
        return (Platform.isIOS || Platform.isAndroid) ? 52 : 26;
      case > 10:
        return (Platform.isIOS || Platform.isAndroid) ? 56 : 28;
      default:
        return (Platform.isIOS || Platform.isAndroid) ? 60 : 30;
    }
  }

  String numberSanitized(double number) {
    final numberString = number.toString();

    final parts = numberString.split('.');

    final decimalLength = parts.length > 1 ? parts[1].length : 0;

    if (numberString.length < 8) {
      return number.toStringAsFixed(decimalLength);
    } else {
      return number.toStringAsFixed(8);
    }
  }

  void setNumber(String number) {
    if (lastDisplayValue != '0' || displayValue == 'Divisão por zero') {
      clearCalculator();
    }
    switch (number) {
      case '0':
        if (currentValue == '0') {
          if (displayValue[displayValue.length - 1] != '0') {
            setState(() {
              displayValue = '$displayValue$number';
              currentValue = number;
            });
          }
        } else {
          setState(() {
            displayValue = '$displayValue$number';
            currentValue = '$currentValue$number';
          });
        }
        print('currentValue: $currentValue');
        print('displayValue: $displayValue');
        break;
      case ',':
        if (currentValue == '0') {
          if (displayValue != '0' &&
              displayValue[displayValue.length - 1] != '0') {
            setState(() {
              displayValue = '${displayValue}0$number';
              currentValue = '${currentValue}0$number';
            });
          } else {
            setState(() {
              displayValue = '$displayValue$number';
              currentValue = '$currentValue$number';
            });
          }
        } else {
          if (!displayValue.contains(',')) {
            setState(() {
              displayValue = '$displayValue$number';
              currentValue = '$currentValue$number';
            });
          }
        }
        print('currentValue: $currentValue');
        print('displayValue: $displayValue');
        break;
      // print('it is ,');
      default:
        {
          if (currentValue == '0') {
            if (displayValue != '0' &&
                displayValue[displayValue.length - 1] == '0') {
              setState(() {
                displayValue =
                    displayValue.substring(0, displayValue.length - 1) + number;
                currentValue = number;
              });
              break;
            }
            if (displayValue == '0') {
              setState(() {
                displayValue = number;
                currentValue = number;
              });
            } else {
              setState(() {
                displayValue = '$displayValue$number';
                currentValue = number;
              });
            }
          } else {
            setState(() {
              displayValue = '$displayValue$number';
              currentValue = '$currentValue$number';
            });
          }
        }
        print('currentValue x: $currentValue');
        print('displayValue x: $displayValue');
        break;
    }
  }

  void setOperator(operator) {
    if (displayValue == 'Divisão por zero' && operator != 'AC') {
      return;
    }

    switch (operator) {
      case 'AC':
        clearCalculator();
        break;
      case 'RM':
        // print(displayValue.length);
        if (displayValue.length == 1) {
          setState(() {
            clearCalculator();
          });
        } else {
          setState(() {
            displayValue = displayValue.substring(0, displayValue.length - 1);
            currentValue = currentValue.substring(0, currentValue.length - 1);
          });
        }
        break;
      case '+/-':
        if (currentValue == '0') {
          return;
        }

        print('currentValue: $currentValue');
        print('currentOperation: $currentOperation');
        // if (currentOperation.length > 1) {
        String newDisplay = currentValue.replaceAll('(', '');
        newDisplay = newDisplay.replaceAll(')', '');
        print('newDisplay: $newDisplay');

        String testeNumber = currentOperation.join();
        print('testeNumber: $testeNumber');
        if (double.parse(newDisplay) > 0) {
          setState(() {
            displayValue = '$testeNumber(-$currentValue)';
            currentValue = '(-$currentValue)';
          });
          print('positivo');
        } else {
          newDisplay = newDisplay.replaceAll('-', '');
          setState(() {
            displayValue = '$testeNumber$newDisplay';
            currentValue = newDisplay;
          });
          print('negativo');
        }
        // }
        break;
      case '+' || '-' || 'x' || '÷' || '%':
        if (currentOperation.isNotEmpty) {
          if (currentOperation.last == '+' ||
              currentOperation.last == '-' ||
              currentOperation.last == 'x' ||
              currentOperation.last == '%' ||
              currentOperation.last == '÷') {
            if (currentValue == '0') {
              setState(() {
                displayValue =
                    displayValue.substring(0, displayValue.length - 1) +
                        operator;
                currentOperation.last = operator;
              });
              break;
            }
          }
        }
        print('currentValue: $currentValue');
        print('displayValue: $displayValue');
        currentOperation.add(currentValue);
        currentOperation.add(operator);
        setState(() {
          lastDisplayValue = '0';
          displayValue = currentOperation.join();
          currentValue = '0';
        });
        break;
      case "=":
        // if (int.parse(currentValue) >= 0) {
        if (currentOperation.length > 1) {
          print('currentValue: $currentValue');
          print('displayValue: $displayValue');
          currentOperation.add(currentValue);
          print('currentOperation.length: ${currentOperation.length}');
          print('currentOperation: $currentOperation');
          // num result = double.parse(currentOperation[0]);

          String expression = currentOperation.join();
          print('expression: $expression');

          expression = expression.replaceAll('x', '*');
          expression = expression.replaceAll('÷', '/');
          expression = expression.replaceAll(',', '.');
          print('expression: $expression');

          final parser = Expression.parse(expression);
          print('parse: $parser');

          const evaluetor = ExpressionEvaluator();
          var result = evaluetor.eval(parser, {});

          if (result == double.infinity || result == double.negativeInfinity) {
            setState(() {
              lastDisplayValue = displayValue;
              displayValue = 'Divisão por zero';
            });
          } else {
            setState(() {
              lastDisplayValue = displayValue;
              displayValue = (result % 1 == 0)
                  ? result.toInt().toString()
                  : numberSanitized(result);
              currentValue = displayValue;
              currentOperation = [];
            });
          }
          print('result: $result');
          print(currentOperation);
        }
        // }
        break;
    }
  }
}
