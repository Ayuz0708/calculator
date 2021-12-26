import 'package:flutter/material.dart';
void main()
{
  runApp(Myapp());

}
class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int a;
  int b;
  String display="";
  String res;
  String operationtoperform;

  void btnclicked(String btn)
  {
    if(btn=='C')
      {
        a=0;
        b=0;
        display="";
        res="";
      }
    else if(btn=='+' || btn=='-' || btn=='x' || btn=='/')
      {
        a=int.parse(display);
        res="";
        operationtoperform=btn;

      }
     else if(btn=='=')
       {
         b=int.parse(display);
         if(operationtoperform=='+')
           {
             res=(a+b).toString();
           }
         else if(operationtoperform=='-')
         {
           res=(a-b).toString();
         }
         else if(operationtoperform=='x')
         {
           res=(a*b).toString();
         }
         else if(operationtoperform=='/')
         {
           res=(a~/b).toString();
         }
       }
      else
        {
          res=int.parse(display + btn).toString();
        }
      setState(() {
        display=res;
      });
  }

  Widget customwidget(String btn){
    return Expanded(
        child: OutlineButton(
          padding: EdgeInsets.all(25.0),
          onPressed: () => btnclicked(btn),
          child: Text("$btn",style: TextStyle(fontSize: 25.0),),
          splashColor: Colors.black,
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Container(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Expanded(

                  child: Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: Text("$display",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                  )
              ),
              Row(

                children: [
                  customwidget("9"),
                  customwidget("8"),
                  customwidget("7"),
                  customwidget("+"),
                ],
              ),
              Row(
                children: [
                  customwidget("6"),
                  customwidget("5"),
                  customwidget("4"),
                  customwidget("-"),
                ],
              ),
              Row(
                children: [
                  customwidget("3"),
                  customwidget("2"),
                  customwidget("1"),
                  customwidget("x"),
                ],
              ),
              Row(
                children: [
                  customwidget("C"),
                  customwidget("0"),
                  customwidget("="),
                  customwidget("/"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
