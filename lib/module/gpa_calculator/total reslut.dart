import 'package:flutter/material.dart';

class TotalResultScreen extends StatelessWidget {
  final double result;

  TotalResultScreen({
    required this.result,

  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xfffbd7d7),

      appBar: AppBar(
        elevation: 0,
        iconTheme:const IconThemeData(
            color: Color(0xff004080)
        ),
        title:const Text(
          'Total result',
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