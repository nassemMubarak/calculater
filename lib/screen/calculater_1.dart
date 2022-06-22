import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../widget/calculate_gesturedetector.dart';

class Calculate1 extends StatefulWidget {
  const Calculate1({Key? key}) : super(key: key);

  @override
  State<Calculate1> createState() => _Calculate1State();
}

class _Calculate1State extends State<Calculate1> {
  String _text='';
  String _containt='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(onPressed: (){
          setState((){
            Navigator.of(context).pop();
          });
        }, icon: Icon(Icons.cable_outlined)),
        title: const Text('Calculate'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(_containt,textAlign: TextAlign.right,style: TextStyle(color: Colors.teal,fontSize: 16),),
                    Spacer(),
                    Text(_text.length>0?_text:'0.0',),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CalculaterGet(
                        text: 'CE',
                        colorText: Colors.white,
                        backgroundColorText: Colors.orange,
                        onTape: () {
                          setState((){
                            _text='';
                            _containt='';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                          text: 'C',
                          colorText: Colors.white,
                          backgroundColorText: Colors.orange.withOpacity(0.5),
                      onTape: (){
                            setState((){
                              _text='';
                            });
                      },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                          onTape: (){
                            setState((){
                              _text+='%';
                            });
                          },
                          text: '%',
                          colorText: Colors.white,
                          backgroundColorText: Colors.orange.withOpacity(0.5)),
                    ),
                    Expanded(
                      child: CalculaterGet(
                          onTape: (){
                            setState((){
                              _text+='÷';
                            });
                          },
                          text: '÷',
                          colorText: Colors.white,
                          backgroundColorText: Colors.blue.withOpacity(0.8)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CalculaterGet(
                        text: '7',
                        onTape: () {
                          setState(() {
                            _text += '7';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '8',
                        onTape: () {
                          setState(() {
                            _text += '8';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '9',
                        onTape: () {
                          setState(() {
                            _text += '9';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        onTape: () {
                          setState(() {
                            _text += 'x';
                          });
                        },
                        text: 'x',
                        colorText: Colors.white,
                        backgroundColorText: Colors.blue.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CalculaterGet(
                        text: '4',
                        onTape: (){
                          setState((){
                            _text+='4';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '5',
                        onTape: (){
                          setState((){
                            _text+='5';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '6',
                        onTape: (){
                          setState((){
                            _text+='6';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        onTape: (){
                          setState((){
                            _text+='-';
                          });
                        },
                        text: '-',
                        colorText: Colors.white,
                        backgroundColorText: Colors.deepPurple.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CalculaterGet(
                        text: '1',
                        onTape: (){
                          setState((){
                            _text+='1';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '2',
                        onTape: (){
                          setState((){
                            _text+='2';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '3',
                        onTape: (){
                          setState((){
                            _text+='3';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        onTape: (){
                          setState((){
                            _text+='+';
                          });
                        },
                        text: '+',
                        colorText: Colors.white,
                        backgroundColorText: Colors.blue.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CalculaterGet(
                        text: '',
                        icon: Icon(Icons.backspace_outlined),
                        onTape: (){
                          setState(() {
                            _text = _text.substring(0,_text.length-1);
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '0',
                        onTape: (){
                          setState((){
                            _text+='0';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        text: '.',
                        onTape: (){
                          setState((){
                            _text+='.';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CalculaterGet(
                        onTape: (){
                          setState((){
                            setState((){
                              Parser parser = Parser();
                              _containt+=_text+'\n';
                              _text = _text.replaceAll('x', '*');
                              _text = _text.replaceAll('÷', '/');
                              try{
                                Expression expression = parser.parse(_text);
                                ContextModel contextModel = ContextModel();
                                _text = expression.evaluate(EvaluationType.REAL,contextModel).toString();

                              }catch(e){
                                _text=_text.substring(0,_text.length-1);
                                Expression expression = parser.parse(_text);
                                ContextModel contextModel = ContextModel();
                                _text = expression.evaluate(EvaluationType.REAL,contextModel).toString();
                              }
                          });
                          });
                        },
                        text: '=',
                        colorText: Colors.white,
                        backgroundColorText: Colors.green.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
    );
  }
}
