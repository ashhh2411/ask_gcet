import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../model/post_model.dart';
import '../../shared/component/component.dart';
import 'add_event_screen.dart';

class EventsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit, AskPnuStates>(
     listener: (context, state){},
     builder: (context, state){
       return ConditionalBuilder(
         condition: AskPunCubit.get(context).posts.isNotEmpty,
         builder:(context)=>  SingleChildScrollView(
           child: Column(
             children: [
               TextButton(onPressed: (){
                 navigateTo(context, AddEventScreen());
               },
                   child:const Text(
                     'Add A New Event',
                   )
               ),
               ListView.separated(
                   physics:const BouncingScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (context, index)=>buildEventItem (context, AskPunCubit.get(context).posts[index]),
                   separatorBuilder:(context, index)=>const SizedBox(
                     height:0 ,
                   ),
                   itemCount: AskPunCubit.get(context).posts.length
               ),
             ],
           ),
         ) ,
         fallback: (context)=>  Center(
           child: TextButton(onPressed: (){
             navigateTo(context, AddEventScreen());
           },
               child:const Text(
                 'Add A New Event',
               )
           ),
         ),
       );
     },
    ) ;

  }

  Widget buildEventItem (context, PostModel model)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
     height: 166,
     decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
     ),
     child: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            children: [
              Column(
              children: [
                Text(
                  '${model.dateTime}',
                  style:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),
                ),
              ],
             ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.text}',
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style:const TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'With dr. ${model.drName}',
                        style:Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),

            ],
           ),
         ),
         const  SizedBox(
           height: 30,
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             TextButton(
               onPressed: (){},
               child: Container(
                 height: 27,
                 width: 55,
                 color: Color(0xfffbd7d7),
                 child:const Center(
                   child: Text(
                     'Going',
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 18
                     ),
                   ),
                 ),
               ),
             ),
             TextButton(
               onPressed: (){},
               child: Container(
                 height: 27,
                 width: 55,
                 color:const Color(0xfffbd7d7),
                 child:const Center(
                   child: Text(
                     'Ignore',
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 18
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ],
     ),
    ),
  );
}
