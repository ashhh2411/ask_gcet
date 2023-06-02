
import 'package:askpn/module/sign_screen.dart';
import 'package:flutter/material.dart';

import '../shared/component/component.dart';

class LanguagesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
    appBar: AppBar(
      elevation: 0,
    ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 200,
                width: 200,
                child:
                const Image(
                  image: AssetImage('assets/images/icon.png',)
                  ,),
            ),
          ),
          const  SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: (){
              navigateTo(context, SignInScreen());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 230,
                  height: 75,
                  color: Colors.white,
                ),
                Container(width: 225,
                  height: 70,
                  color:const Color(0xff004080),
                  child:const Center(
                    child: Text(
                      'العربية',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const   SizedBox(
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
              Container(width: 225,
                height: 70,
                color:const Color(0xff004080),
                child:const  Center(
                  child: Text(
                    'English',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
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
