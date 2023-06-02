
import 'package:askpn/module/gpa_calculator/total.dart';
import 'package:flutter/material.dart';

import '../../shared/component/component.dart';
import 'class.dart';

class GPACalculatorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        iconTheme:const IconThemeData(
            color: Color(0xff004080)
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              child:
              const Image(
                image: AssetImage('assets/images/icon.png',)
                ,),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 230,
                height: 75,
                color: Colors.white,
              ),
              InkWell(onTap: (){
                navigateTo(context, ClassScreen());
              },
                child: Container(width: 225,
                  height: 70,
                  color:const Color(0xff004080),
                  child:const Center(
                    child: Text(
                      'Grade Average',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 230,
                height: 75,
                color: Colors.white,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, TotalScreen());
                },
                child: Container(width: 225,
                  height: 70,
                  color:const Color(0xff004080),
                  child:const Center(
                    child: Text(
                      'GPA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
