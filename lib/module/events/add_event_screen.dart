
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../shared/component/component.dart';

class AddEventScreen extends StatelessWidget {
  var titleController = TextEditingController();
  var doctorController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit, AskPnuStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
            backgroundColor:Colors.white,
            appBar: AppBar(
              actionsIconTheme: IconThemeData(
                color: Color(0xff004080)
              ),
              actions: [

                TextButton(onPressed: (){
                    AskPunCubit.get(context).createPost(
                        text: titleController.text,
                        drName: doctorController.text,
                        dateTime: dateController.text
                    );
                  },
                    child:const Text(
                      ' Add Event  ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff004080)
                      ),
                    )
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if(state is CreatePostLoadingState)
                    const LinearProgressIndicator(),
                  if(state is CreatePostLoadingState)
                    const  SizedBox(
                    height: 5,
                  ),

                  DefaultFormField(
                    controller: titleController,
                    label: 'New Event',
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Event must not be empty';
                      }
                      return 'null';
                    },
                    prefix: Icons.title,
                  ),
                  const  SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                    controller: doctorController,
                    label: 'Doctor Name',
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'The Name must not be empty';
                      }
                      return 'null';
                    },
                    prefix: Icons.person,
                  ),
                  const  SizedBox(
                    height: 10,
                  ),
                  DefaultFormField(
                      onTap: () {

                        showDatePicker(
                            context: context,
                            initialDate:
                            DateTime
                                .now(),
                            firstDate:
                            DateTime
                                .now(),
                            lastDate: DateTime
                                .parse(
                                '2021-10-03'))
                            .then((value) =>
                        dateController.text = DateFormat
                            .yMMMd()
                            .format(
                            value!));
                      },
                      controller: dateController,
                      label: 'Task Deadline',
                      type:
                      TextInputType.datetime,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Date must not be empty';
                        }

                        return 'null';
                      },
                      prefix:
                      Icons.calendar_today),
                ],
              ),
            )
        );
      },
    );
  }
}
