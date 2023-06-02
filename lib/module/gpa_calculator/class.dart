import 'package:flutter/material.dart';

import 'class_result.dart';

class ClassScreen extends StatefulWidget {
  @override
  _ClassScreenState createState() => _ClassScreenState();
}

int points = 40;
int hours = 20;

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        iconTheme:const IconThemeData(
            color: Color(0xff004080)
        ),
        title:const Text(
          'Separation rate calculation',
          style: TextStyle(fontSize: 22
          ,
          color:Color(0xff004080),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'The total number of chapter points',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$points',
                    style:const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            points--;
                          });
                        },
                        heroTag: 'weight-',
                        mini: true,
                        backgroundColor:const Color(0xff004080),
                        child:const Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                          backgroundColor: Color(0xff004080),
                        onPressed: () {
                          setState(() {
                            points++;
                          });
                        },
                        heroTag: 'weight+',
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
                    'The total number of class hours',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$hours',
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
                            hours--;
                          });
                        },
                        heroTag: 'age-',
                        mini: true,
                        child:const Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        backgroundColor: Color(0xff004080),
                        onPressed: () {
                          setState(() {
                            hours++;
                          });
                        },
                        heroTag: 'age+',
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
                color:  Color(0xff004080),
                onPressed: () {
                  dynamic result = points / hours;
                  print(result);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClassResultScreen(
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
    );
  }
}