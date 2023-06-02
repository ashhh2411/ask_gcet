
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../shared/component/component.dart';
import '../about/about_screen.dart';
import '../gpa_calculator/gpa_calculator.dart';
import '../location/location_screen.dart';
import '../prayer_times.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit, AskPnuStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit =AskPunCubit.get(context);
        return Column(
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                child:
                const  Image(
                  image: AssetImage('assets/images/icon.png',),),
              ),
            ),
            const Text(
              'Services',
              style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 30
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      navigateTo(context, PrayerTime());
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          color: Colors.white,
                        ),
                        Container(
                          width: 145,
                          height: 45,
                          color:const Color(0xff004080),
                          child:const Center(
                            child: Padding(
                              padding:  EdgeInsets.only(right: 10),
                              child: Text(
                                'prayer time',
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
                      navigateTo(context, GPACalculatorScreen());
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 165,
                          height: 50,
                          color: Colors.white,
                        ),
                        Container(width: 160,
                          height: 45,
                          color:const Color(0xff004080),
                          child:const Center(
                            child: Padding(
                              padding:  EdgeInsets.only(right: 10),
                              child: Text(
                                'Rate calculation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
                      cubit.openLaunchURLTalabat();
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
                                'Talabat',
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
                      navigateTo(context, LocationScreen());
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 165,
                          height: 50,
                          color: Colors.white,
                        ),
                        Container(width: 160,
                          height: 45,
                          color:const Color(0xff004080),
                          child:const Center(
                            child: Padding(
                              padding:  EdgeInsets.only(right: 10),
                              child: Text(
                                'Where am I',
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
                      cubit.openLaunchURLOtaxi();
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
                            child: Padding(
                              padding:  EdgeInsets.only(right: 10),
                              child: Text(
                                'otaxi',
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
                      cubit.openLaunchURLPlane();
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 165,
                          height: 55,
                          color: Colors.white,
                        ),
                        Container(width: 160,
                          height: 50,
                          color:const Color(0xff004080),
                          child: const Center(
                            child: Text(
                              'Academic programmes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
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
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){
                cubit.openLaunchURLCalender();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 50,
                    color: Colors.white,
                  ),
                  Container(width: 235,
                    height: 45,
                    color:const Color(0xff004080),
                    child:const Center(
                      child: Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Text(
                          'University calendar',
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
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){
                navigateTo(context, AboutScreen());
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 50,
                    color: Colors.white,
                  ),
                  Container(width: 235,
                    height: 45,
                    color:const Color(0xff004080),
                    child:const Center(
                      child: Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Text(
                          'About what',
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
          ],
        );
      },
    );
  }
}
