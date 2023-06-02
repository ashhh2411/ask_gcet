
import 'package:askpn/module/register/howareyou_screen.dart';
import 'package:flutter/material.dart';

import '../shared/component/component.dart';
import 'lang_screen.dart';
import 'login/login_screen.dart';

class SignInScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context, LanguagesScreen());
        },
            icon:const Icon(Icons.arrow_back_ios,
            color: Color(0xff004080),
            ),
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
          const  SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: (){
              navigateTo(context, LoginScreen());
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
                      'sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const    SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: (){
              navigateTo(context, HowAreYouScreen());
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
                      'Register as a new user',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
