import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class HomeLayoutScreen extends StatelessWidget {
  int currentState =0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskPunCubit,AskPnuStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit =AskPunCubit.get(context);
        return  Scaffold(
          key: scaffoldKey,
           backgroundColor:Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
          body:SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
              child: Column(
                children: [
                  cubit.screens[cubit.currentIndex],
                ],
              ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor:Colors.white,
            elevation: 0,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.message_outlined),
                label: 'Messages',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.settings_applications_outlined),
                label: 'Settings',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person_pin),
                label: 'Profile',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.event_available_outlined),
                label: 'Events',
              ),
            ],
          ),
        );
      },
    );
  }
}
