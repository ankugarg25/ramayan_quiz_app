import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
int currentQuestionIndex=0;
  List questionBank =[
   Question.name("Ram is the son of Kaushalya and Dasharath",true),
    Question.name("Sumitra was the mother of Bharata",false),
    Question.name(" Bharatha is the son of Kaikai",true),
    Question.name("KeyKayi was the mother of Lakshmana ",false),
    Question.name("Sita was daughter of Janak",true),
    Question.name("Rama is the avatar of Krishana God ",false),
    Question.name(" Laxman married Urmila",true),
    Question.name(" KING OF AYODHYA was Rama",false),
    Question.name(" Bharatha is the son of Kaikai",true),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Ramayan Quiz App"),
        centerTitle: true,

      ),
      body: Builder(
        builder: (BuildContext context)=> Container(
          child: Column(
            children: <Widget>[
              Center(
                  child: Image.asset("images/ramayan.jpg",height: 350,width: 300,))

            ,Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.blueGrey,style: BorderStyle.solid
                    )
                  ),
                height: 120,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[currentQuestionIndex].questionText,
                      style:TextStyle(
                        fontSize: 25,color: Colors.blue
                      ) ,),
                  )),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[RaisedButton(
                  onPressed: () => _prevQuestion(),
                  color: Colors.blue,
                  child: Icon(Icons.arrow_back,),
                ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true,context),
                    color: Colors.blue,
                    child: Text("TRUE",style: TextStyle(color: Colors.black),),
                  ),

                  RaisedButton(
                    onPressed: () => _checkAnswer(false,context),
                    color: Colors.blue,
                    child: Text("FALSE",style: TextStyle(color: Colors.black),),
                  ),

                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blue,
                    child: Icon(Icons.arrow_forward,),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice,BuildContext context) {
if(userChoice == questionBank[currentQuestionIndex].isCorrect){
  final snackbar = SnackBar(
      duration:  Duration(milliseconds: 500),
      backgroundColor: Colors.green,
      content:Text("Correct"));
    Scaffold.of(context).showSnackBar(snackbar);
    _updateQuestion();
}else{
  final snackbar = SnackBar(
      duration:  Duration(milliseconds: 500),
      backgroundColor: Colors.red,
      content:Text("Incorrect"));
  Scaffold.of(context).showSnackBar(snackbar);
  _updateQuestion();
}

  }
  _updateQuestion(){
    setState(() {
      currentQuestionIndex =(currentQuestionIndex+1)% questionBank.length;
    });
  }
  _nextQuestion(){
_updateQuestion();
        }
_prevQuestion(){
  setState(() {
    currentQuestionIndex =(currentQuestionIndex-1)% questionBank.length;
  });
}
}
