import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit, AskPnuStates>(
      listener: (context, state){},
      builder: (context, state){
        var userModel = AskPunCubit.get(context).userModel;
        return Column(
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                child:
                const   Image(
                  image: AssetImage('assets/images/icon.png',),),
              ),
            ),
            const  Text(
              'Profile',
              style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 30
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const   Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const   SizedBox(
                        width: 5,
                      ),
                      const    Text(
                        ':',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const  SizedBox(
                        width: 5,
                      ),
                      if(userModel?.name !=null)
                      Text(
                        '${userModel?.name}',
                        style:const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Year',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const   SizedBox(
                        width: 5,
                      ),
                      const    Text(
                        ':',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const  SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${userModel?.year}',
                        style:const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const  Text(
                        'Status',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const   SizedBox(
                        width: 5,
                      ),
                      const  Text(
                        ':',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const  SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${userModel?.status}',
                        style:const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:const [
                        Text(
                          'Academic supervisor',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ':',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'DR.',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Text(
                      '${userModel?.academic}',
                      style:const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
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
