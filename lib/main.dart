
import 'package:askpn/module/login/login_screen.dart';
import 'package:askpn/shared/bloc_observer.dart';
import 'package:askpn/shared/component/contasnt.dart';
import 'package:askpn/shared/network/local/cach_helper.dart';
import 'package:askpn/shared/network/remote/dio_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/state.dart';
import 'layout/home_layout_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen((event) {
    print('success');
  }).onError((error){
    print('error');
  });
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  Widget widget;

  uId = CacheHelper.getData(key: 'uId');

  if(uId != null){
    widget = HomeLayoutScreen();
  }else{
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>AskPunCubit()..getUserModel()..getPosts(),
        child: BlocConsumer<AskPunCubit, AskPnuStates>(
          listener: (context, state){},
          builder: (context, state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                colorScheme: ColorScheme.fromSwatch(
                    backgroundColor: Colors.indigo
                  // Color(0xff009E8F),
                ),
                iconTheme: const IconThemeData(
                    color: Colors.black
                ),
                brightness: Brightness.light,
                appBarTheme: const AppBarTheme(
                  // titleTextStyle: TextStyle(
                  //   color: Color(0xff004080),
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 30,
                  // ),
                  iconTheme: IconThemeData(
                    color: Color(0xff004080)
                  ),
                  color: Colors.white,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor:Colors.white,

                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.black,
                  selectedLabelStyle: TextStyle(
                      color: Colors.blue
                  ),
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              home: startWidget,
            );
          },
        )
    );

  }

}

