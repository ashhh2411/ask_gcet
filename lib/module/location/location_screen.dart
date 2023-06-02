import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class LocationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context, HomeScreen());
        }, icon: const Icon(Icons.arrow_back,
          color: Color(0xff004080),
        )),
      ),
      body:const Image(
        image: AssetImage(
          'assets/images/map.png',
        ),
      ),
    );
  }
}
