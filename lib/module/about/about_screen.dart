import 'package:askpn/layout/cubit/cubit.dart';
import 'package:flutter/material.dart';
import '../../shared/component/component.dart';
import '../home/home_screen.dart';
import '../message/connections_screen.dart';

class AboutScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context, HomeScreen());
        }, icon: const Icon(Icons.arrow_back,
        color: Color(0xff004080),
        )),
      ),
      backgroundColor:Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              child:
              const Image(
                image: AssetImage('assets/images/icon.png',),),
            ),
          ),
          const Text(
            'Our Services',
            style: TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 30
            ),
          ),
          const   SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    AskPunCubit.get(context).openLaunchBanner();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        color: Colors.white,
                      ),
                      Container(width: 145,
                        height: 45,
                        color:const Color(0xff004080),
                        child: const Center(
                          child: Text(
                            'SRS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateTo(context, ConnectionsScreen());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        color: Colors.white,
                      ),
                      Container(width: 145,
                        height: 45,
                        color:const Color(0xff004080),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              'Activities',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateTo(context, ConnectionsScreen());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 165,
                        height: 90,
                        color: Colors.white,
                      ),
                      Container(width: 160,
                        height: 85,
                        color:const Color(0xff004080),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: const [
                              Text(
                                'Transfer out of',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'the university',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const  SizedBox(
                width: 20,
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateTo(context, ConnectionsScreen());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 165,
                        height: 90,
                        color: Colors.white,
                      ),
                      Container(width: 160,
                        height: 85,
                        color:const Color(0xff004080),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children:const [
                              Text(
                                'Transfer within',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'the university',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const  SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateTo(context, ConnectionsScreen());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        color: Colors.white,
                      ),
                      Container(width: 145,
                        height: 45,
                        color:const Color(0xff004080),
                        child: const Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Training',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    navigateTo(context, ConnectionsScreen());
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        color: Colors.white,
                      ),
                      Container(width: 145,
                        height: 45,
                        color:const Color(0xff004080),
                        child:const Center(
                          child: Text(
                            'Graduates',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
