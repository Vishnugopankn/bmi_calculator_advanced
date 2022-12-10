import 'package:flutter/material.dart';
class Result extends StatefulWidget {
double height;
int weight;
int age;
   Result({Key? key, required  this.height, required  this.weight, required  this.age}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double bmi=0;
  @override
  void initState() {
    super.initState();
    Bmi();
  }
  void Bmi(){
    double h=double.parse(widget.height.toString());
    double w=double.parse(widget.weight.toString());
    double b=w/h*h;

    setState(() {
      bmi=b;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Result",style: TextStyle(color: Colors.orange,fontSize: 50,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                width: double.maxFinite,height: 150,
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Height",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
                            Text("Weight",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
                            Text("Age",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.height.toStringAsFixed(2),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
                            Text(widget.weight.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
                            Text(widget.age.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 30),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30.0),
               child: Container(
                 width: double.maxFinite,height: 60,color: Colors.teal,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Text("BMI",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                     Text("$bmi",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                   ],
                 ),
               ),
             )
           ],
         ),
    );
  }
}
