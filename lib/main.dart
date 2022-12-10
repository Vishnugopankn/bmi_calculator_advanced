import 'package:bmi_calculator_advanced/sample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Bmi(),
  ));
}

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  double slidervalue = 0;
  int count=0;
  int count2=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF233741)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 100,
                              color: Colors.red,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,
                                  color: Colors.white54),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF233741)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 100,
                            color: Colors.red,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.white54,),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 130,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF233741),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,),
                        ),
                        Text(
                          "${slidervalue.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                            color: Colors.white54,),
                        ),
                        Slider(
                            activeColor: Colors.yellow,
                            thumbColor: Colors.orange,
                            divisions: 15,
                            min: 0,
                            max: 500,
                            value: slidervalue,
                            onChanged: (value) {
                              setState(() {
                                slidervalue = value;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child:
                  GridView.count(
                    shrinkWrap: true,
                      crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:  Color(0xFF233741),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                              color: Colors.white54,),
                          ),
                          Text(
                            "$count",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                              color: Colors.white54,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                   FloatingActionButton(onPressed: (){
                                     setState(() {
                                       decrementweight();
                                     });
                                   },
                                   child: Icon(Icons.remove),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  incrementweight();
                                });
                              },
                                child: Icon(Icons.add),),

                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:  Color(0xFF233741),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.white54,),
                          ),
                          Text(
                            "$count2",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                              color: Colors.white54,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  decrementage();
                                });
                              },
                                child: Icon(Icons.remove),),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  incrementage();
                                });
                              },
                                child: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],),
                ),
              ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.maxFinite,height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white54,
                    ),
                    child:
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Result(height:slidervalue,
                          weight:count,age:count2)));
                    }, child: Text("Calculate",style: TextStyle(color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,fontSize: 30),)),
                  ),
                ),
            ],
            ),
          ),
        ));
  }

  void decrementweight() {
    if(count==0){
      count=0;
    }else{
      count--;
    }
  }

  void incrementweight() {
    count++;
  }

  void decrementage() {
    if(count2==0){
      count2=0;
    }else{
      count2--;
    }
  }

  void incrementage() {
    count2++;
  }
}
