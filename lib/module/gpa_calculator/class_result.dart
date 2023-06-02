import 'package:flutter/material.dart';

class ClassResultScreen extends StatelessWidget {
  final double result;

  ClassResultScreen({
    required this.result,

  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme:const IconThemeData(
            color: Color(0xff004080)
        ),
        title:const Text(
          'Class result',
          style: TextStyle(fontSize: 20,
              color: Color(0xff004080)
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Result: $result',
              style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}