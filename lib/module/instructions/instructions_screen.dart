import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../about/about_screen.dart';

class InstructionsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit, AskPnuStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =AskPunCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(onPressed: (){
              Navigator.pop(context, AboutScreen());
            }, icon:const Icon(Icons.arrow_back,
              color:Color(0xff004080),
            )),
          ),
          backgroundColor:Colors.white,
          body: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child:
                        const Image(
                          image: AssetImage('assets/images/icon.png',),),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Counseling questions',
                        style: TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize: 30
                        ),
                      ),
                    ),
                    const  SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: InkWell(
                        onTap: (){
                          cubit.openLaunchDeleteAndAdd();
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
                                  'Deletion and addition',
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: InkWell(
                        onTap: (){
                          cubit.openLaunchURLInstruction();
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
                                  'Mentoring',
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
                      height: 10,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: InkWell(
                        onTap: (){
                          cubit.openLaunchBanner();
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
                              child: const Center(
                                child: Text(
                                  'Banner',
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
                    const   SizedBox(
                      height: 10,
                    ),
                    // Align(
                    //   alignment: AlignmentDirectional.centerEnd,
                    //   child: Stack(
                    //     alignment: Alignment.center,
                    //     children: [
                    //       Container(
                    //         width: 230,
                    //         height: 75,
                    //         color: Colors.white,
                    //       ),
                    //       Container(width: 225,
                    //         height: 70,
                    //         color:Color(0xff004080),
                    //         child: Center(
                    //           child: Text(
                    //             'إعادة التصحيح',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 25,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ]
              ),
            ),
          ),
        );
      },
    );
  }
}
