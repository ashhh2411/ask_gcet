import 'package:flutter/material.dart';

import '../../shared/component/contasnt.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isSwitch =true;
    bool isSwitch2 =false;
    return Column(
      children: [
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const  Text(
                'Permission',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              const  Spacer(),
              Switch(
                activeColor:const Color(0xfffbd7d7),
                  value: isSwitch,
                  onChanged: (newValue){}
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey[400],
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const   Text(
                'Push Notification',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
              const  Spacer(),
              Switch(
                  activeColor:const Color(0xfffbd7d7),
                  value: isSwitch2,
                  onChanged: (newValue){}
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey[400],
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const     Text(
                'Location Services',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
              const Spacer(),
              Switch(
                  activeColor:const Color(0xfffbd7d7),
                  value: isSwitch,
                  onChanged: (newValue){}
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey[400],
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const   Text(
                'Sounds',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
              const Spacer(),
              Switch(
                  activeColor:const Color(0xfffbd7d7),
                  value: isSwitch2,
                  onChanged: (newValue){}
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey[400],
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const  Text(
                'Adds',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
              const Spacer(),
              Switch(
                  activeColor:const Color(0xfffbd7d7),
                  value: isSwitch,
                  onChanged: (newValue){}
              ),
            ],
          ),
        ),
        Container(
          height: 16,
          width: double.infinity,
          color:const Color(0xfffbd7d7),
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const [
              Text(
                'Help',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey[400],
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const [
              Text(
                'About Application',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey[400],
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const [
              Text(
                'Send Feedback',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey[400],
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const [
              Text(
                'Support',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 150,
          height: 40,

          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              color:const Color(0xff004080),

          ),
          child: MaterialButton(onPressed: (){
            signOut(context);
          },
          child:const Text(
            'LOGOUT',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          ),
        ),


      ],
    );
  }
}
