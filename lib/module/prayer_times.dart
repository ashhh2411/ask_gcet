
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/cubit/cubit.dart';
import '../layout/cubit/state.dart';
import 'home/home_screen.dart';

class PrayerTime extends StatefulWidget {


  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit, AskPnuStates>(
     listener: (context, state){},
     builder: (context, state){
       return  Scaffold(
         backgroundColor:Colors.white,
         appBar: AppBar(
           elevation: 0,
           leading: IconButton(onPressed: (){
             Navigator.pop(context, HomeScreen());
           }, icon:const Icon(Icons.arrow_back,
             color: Color(0xff004080),
           )),
         ),
         body:SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Directionality(
               textDirection: TextDirection.rtl,
               child: Column(
                 children: [
                   Center(
                     child: Container(
                       height: 200,
                       width: 200,
                       child:
                       const   Image(
                         image: AssetImage('assets/images/icon.png',),),
                     ),
                   ),
                   const    Text(
                     'عمان - مسقط',
                     style: TextStyle(
                         fontWeight:FontWeight.bold,
                         fontSize: 30
                     ),
                   ),
                   const   SizedBox(
                     height: 10,
                   ),
                   Container(
                     padding:const EdgeInsetsDirectional.only(start: 20),
                     alignment: AlignmentDirectional.center,
                     width: double.infinity,
                     height: 50,
                     color: Colors.white,
                     child: Row(
                       children:const [
                         Expanded(child: Text('الصلاة',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                         Expanded(child: Text('الوقت',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                       ],
                     ),
                   ),
                   Container(
                     width: double.infinity,
                     height: 1.5,
                     color: Colors.grey,
                   ),
                   Container(
                     padding: const EdgeInsetsDirectional.only(start: 20),
                     alignment: AlignmentDirectional.center,
                     width: double.infinity,
                     height: 50,
                     color: Colors.grey[300],
                     child: Row(
                       children:const [
                         Expanded(child: Text('الفجر',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                         Expanded(child: Text('4:01 Am',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                       ],
                     ),
                   ),
                   Container(
                     width: double.infinity,
                     height: 1.5,
                     color: Colors.grey,
                   ),
                   Container(
                     padding:const EdgeInsetsDirectional.only(start: 20),
                     alignment: AlignmentDirectional.center,
                     width: double.infinity,
                     height: 50,
                     color: Colors.white,
                     child: Row(
                       children:const [
                         Expanded(child: Text('الظهر',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                         Expanded(child: Text('12:09 Pm',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                       ],
                     ),
                   ),
                   Container(
                     width: double.infinity,
                     height: 1.5,
                     color: Colors.grey,
                   ),
                   Container(
                     padding:const EdgeInsetsDirectional.only(start: 20),
                     alignment: AlignmentDirectional.center,
                     width: double.infinity,
                     height: 50,
                     color: Colors.grey[300],
                     child: Row(
                       children: const[
                         Expanded(child: Text('العصر',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                         Expanded(child: Text('3:31 Pm',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                       ],
                     ),
                   ),
                   Container(
                     width: double.infinity,
                     height: 1.5,
                     color: Colors.grey,
                   ),
                   Container(
                     padding:const EdgeInsetsDirectional.only(start: 20),
                     alignment: AlignmentDirectional.center,
                     width: double.infinity,
                     height: 50,
                     color: Colors.white,
                     child: Row(
                       children:const [
                         Expanded(child: Text('المغرب',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                         Expanded(child: Text('6:48 Pm',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                       ],
                     ),
                   ),
                   Container(
                     width: double.infinity,
                     height: 1.5,
                     color: Colors.grey,
                   ),
                   Container(
                     padding:const EdgeInsetsDirectional.only(start: 20),
                     alignment: AlignmentDirectional.center,
                     width: double.infinity,
                     height: 50,
                     color: Colors.grey[300],
                     child: Row(
                       children:const [
                         Expanded(child: Text('العشاء',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                         Expanded(child: Text('7:58 Pm',
                           style: TextStyle(
                               fontSize: 18
                           ),
                         )),
                       ],
                     ),
                   ),
                   Container(
                     width: double.infinity,
                     height: 1.5,
                     color: Colors.grey,
                   ),

                 ],
               ),
             ),
           ),
         ) ,
       );
     },
    );
  }
}
