import 'package:askpn/module/gpa_calculator/total%20reslut.dart';
import 'package:flutter/material.dart';

class TotalScreen extends StatefulWidget {
  @override
  _TotalScreenState createState() => _TotalScreenState();
}

int firstPoints = 40;
int secondPoints = 40;
int firstHours = 20;
int secondHours = 20;

class _TotalScreenState extends State<TotalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        iconTheme:const IconThemeData(
            color: Color(0xff004080)
        ),
        title: const Text(
          'Cumulative GPA calculation',
          style: TextStyle(fontSize: 22
            ,
            color:Color(0xff004080),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const  Text(
                      'The total number of points for the first semester',
                      style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$firstPoints',
                      style:const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              firstPoints--;
                            });
                          },
                          heroTag: 'firstPoint-',
                          mini: true,
                          backgroundColor:const Color(0xff004080),
                          child:const Icon(Icons.remove),
                        ),
                        FloatingActionButton(
                          backgroundColor:const Color(0xff004080),
                          onPressed: () {
                            setState(() {
                              firstPoints++;
                            });
                          },
                          heroTag: 'firstPoint+',
                          mini: true,
                          child:const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const  SizedBox(
                height: 20,
              ),
              Container(

                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const  Text(
                      'The total number of first semester hours',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$firstHours',
                      style:const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor:const Color(0xff004080),
                          onPressed: () {
                            setState(() {
                              firstHours--;
                            });
                          },
                          heroTag: 'firstHours-',
                          mini: true,
                          child:const Icon(Icons.remove),
                        ),
                        FloatingActionButton(
                          backgroundColor:const Color(0xff004080),
                          onPressed: () {
                            setState(() {
                              firstHours++;
                            });
                          },
                          heroTag: 'firstHours+',
                          mini: true,
                          child:const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const  Text(
                      'The total number of points for the second semester',
                      style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$secondPoints',
                      style:const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              secondPoints--;
                            });
                          },
                          heroTag: 'secondPoints-',
                          mini: true,
                          backgroundColor:const Color(0xff004080),
                          child:const Icon(Icons.remove),
                        ),
                        FloatingActionButton(
                          backgroundColor:const Color(0xff004080),
                          onPressed: () {
                            setState(() {
                              secondPoints++;
                            });
                          },
                          heroTag: 'secondPoints+',
                          mini: true,
                          child:const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(

                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'The total number of hours of the second semester',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$secondHours',
                      style:const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor:const Color(0xff004080),
                          onPressed: () {
                            setState(() {
                              secondHours--;
                            });
                          },
                          heroTag: 'secondHours-',
                          mini: true,
                          child:const Icon(Icons.remove),
                        ),
                        FloatingActionButton(
                          backgroundColor:const Color(0xff004080),
                          onPressed: () {
                            setState(() {
                              secondHours++;
                            });
                          },
                          heroTag: 'secondHours+',
                          mini: true,
                          child:const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  color:const  Color(0xff004080),
                  onPressed: () {
                   dynamic result1 = firstPoints + secondPoints;
                   dynamic result2 = secondHours + firstHours;

                    dynamic result = result1 / result2;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TotalResultScreen(
                              result: result,
                            )));
                  },
                  child:const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}