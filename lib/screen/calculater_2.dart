import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../widget/calculate_card.dart';
//Liprary math_expressions
class Calculate2 extends StatefulWidget {
  const Calculate2({Key? key}) : super(key: key);

  @override
  State<Calculate2> createState() => _Calculate2State();
}

class _Calculate2State extends State<Calculate2> {
  String _text = '';
  String _containt='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          setState((){
            Navigator.of(context).pushNamed('/calculate1');
          });
        }, icon: Icon(Icons.cable_outlined)),
        backgroundColor: Colors.teal,
        title: const Text('Calculate'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border:const Border.fromBorderSide(
                    BorderSide(color: Colors.teal,width: 1),
                  ),
                  boxShadow: const[
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius:5,
                      offset: Offset(0,5),
                    ),BoxShadow(
                      color: Colors.black12,
                      blurRadius:5,
                      offset: Offset(5,0),
                    ),BoxShadow(
                      color: Colors.black12,
                      blurRadius:5,
                      offset: Offset(-5,0),
                    ),BoxShadow(
                      color: Colors.black12,
                      blurRadius:5,
                      offset: Offset(0,-5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(_containt,textAlign: TextAlign.right,style: TextStyle(color: Colors.teal,fontSize: 16),),
                    Spacer(),
                    Text(_text.length>0?_text:'0.0',),
                  ],
                )),
          ),
          Column(
            children: [
              Row(
                children: [
                  CalculateCard(
                    onTap: (){
                      setState(() {
                        _text = '';
                        _containt='';
                      });
                    },
                    text: 'CE',
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,

                  ),
                  CalculateCard(
                      text: 'C',
                      backgroundColor: Colors.orange.withOpacity(0.5),
                      colorText: Colors.white,
                      onTap: () {
                        setState(() {
                          _text = '';
                        });
                      }),
                  CalculateCard(
                      onTap: (){
                      setState((){
                      _text+='%';
                    });},
                    text: '%',
                    backgroundColor: Colors.orange.withOpacity(0.5),
                    colorText: Colors.white,
                  ),
                  CalculateCard(
                      onTap: (){
                      setState((){
                      _text+='÷';
                    });},
                    text: '÷',
                    backgroundColor: Colors.blue.withOpacity(0.5),
                    colorText: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculateCard(
                    text: '7',
                  onTap: () {
                    setState(() {
                      _text += '7';
                    });
                  }),

                  CalculateCard(
                      text: '8',
                      onTap: () {
                        setState(() {
                          _text += '8';
                        });
                      }),
                  CalculateCard(
                    onTap: (){
                      setState((){
                        _text+='9';
                      });},
                    text: '9',
                  ),
                  CalculateCard(
                    onTap: (){
                      setState((){
                        _text+='x';
                      });},
                    text: 'x',
                    backgroundColor: Colors.teal.withOpacity(0.5),
                    colorText: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculateCard(
                      text: '4',
                      onTap: () {
                        setState(() {
                          _text += '4';
                        });
                      }),

                  CalculateCard(
                      text: '5',
                      onTap: () {
                        setState(() {
                          _text += '5';
                        });
                      }),
                  CalculateCard(
                    onTap: (){
                      setState((){
                        _text+='6';
                      });},
                    text: '6',
                  ),
                  CalculateCard(
                    onTap: (){
                      setState((){
                        _text+='-';
                      });},
                    text: '-',
                    backgroundColor: Colors.pinkAccent.withOpacity(0.5),
                    colorText: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculateCard(
                      text: '1',
                      onTap: () {
                        setState(() {
                          _text += '1';
                        });
                      }),

                  CalculateCard(
                      text: '2',
                      onTap: () {
                        setState(() {
                          _text += '2';
                        });
                      }),
                  CalculateCard(
                    onTap: (){
                      setState((){
                        _text+='3';
                      });},
                    text: '3',
                  ),
                  CalculateCard(
                    onTap: (){
                      setState((){
                        _text+='+';
                      });},
                    text: '+',
                    backgroundColor: Colors.brown.withOpacity(0.5),
                    colorText: Colors.white,
                  ),
                ],
              ),
              Row(
                children: [
                  CalculateCard(
                      text: '',
                      icon: Icon(Icons.backspace_outlined),
                      onTap: () {
                        setState(() {
                          _text = _text.substring(0,_text.length-1);
                        });
                      }),

                  CalculateCard(
                      text: '0',
                      onTap: () {
                        setState(() {
                          _text += '0';
                        });
                      }),
                  CalculateCard(
                    onTap: (){
                      setState((){
                        _text+='.';
                      });},
                    text: '.',
                  ),
                  CalculateCard(
                    onTap: (){
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
                      },
                    text: '=',
                    backgroundColor: Colors.green.withOpacity(0.5),
                    colorText: Colors.white,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
