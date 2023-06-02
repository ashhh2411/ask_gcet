import 'package:askpn/layout/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/chat_model.dart';
import '../../model/post_model.dart';
import '../../model/user_model.dart';
import '../../module/events/events_screen.dart';
import '../../module/home/home_screen.dart';
import '../../module/messages/connection_screen.dart';
import '../../module/profile/profile_screen.dart';
import '../../module/settings/settings_screen.dart';
import '../../shared/component/contasnt.dart';
import '../../shared/network/remote/dio_helper.dart';

class AskPunCubit extends Cubit<AskPnuStates> {
  AskPunCubit() : super(AskPnuInitialState());

  static AskPunCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget>screens = [
    HomeScreen(),
    ConnectionScreen(),
    SettingsScreen(),
    ProfileScreen(),
    EventsScreen(),
  ];

  bool isBottomSheetShown = false;
  Icon floatingButtonIcon = Icon(Icons.edit);

  void changeBottomSheetState(bool isShow, Icon icon) {
    isBottomSheetShown = isShow;
    floatingButtonIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  void changeBottomNav(int index) {
    currentIndex = index;
    if (index ==3 ){
      getUserModel();
    }
    emit(ChangeBottomNavState());
  }


  UserModel? userModel;

  void getUserModel() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(GetUserSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(GetUserErrorState(error.toString()));
    }
    );
  }

  static const talabatUrl = 'https://www.talabat.com/oman?adpos=&gclid=CjwKCAjw04yjBhApEiwAJcvNodVC2DGSI1MeBjbEuIAS5-qlQlRd9Y5rrCgegKrovs8kXxbvj6uk6hoCGjAQAvD_BwE';

  void openLaunchURLTalabat() {
    emit(OpenTalabatLoadingState());

    if (canLaunch(talabatUrl) != null) {
      launch(talabatUrl);
      emit(OpenedTalabatSuccess());
    } else {
      print('Could not launch $talabatUrl');
      emit(OpenedTalabatError());
    }
  }

  static const otaxiUrl = 'https://otaxi.om';

  void openLaunchURLOtaxi() {
    emit(OpenUberLoadingState());

    if (canLaunch(otaxiUrl) != null) {
      launch(otaxiUrl);
      emit(OpenedOtaxiSuccess());
    } else {
      print('Could not launch $otaxiUrl');
      emit(OpenedOtaxiError());
    }
  }

  static const calenderUrl = 'https://gcet.edu.om/ar/admissions/academic-calendars/';

  void openLaunchURLCalender() {
    emit(OpenCalenderLoadingState());

    if (canLaunch(calenderUrl) != null) {
      launch(calenderUrl);
      emit(OpenedCalenderSuccess());
    } else {
      print('Could not launch $calenderUrl');
      emit(OpenedCalenderError());
    }
  }

  static const planeUrl = 'https://gcet.edu.om/ar/programmes/';
  void openLaunchURLPlane()  {
    emit(OpenPlaneLoadingState());

    if(  canLaunch(planeUrl) != null){
      launch(planeUrl);
      emit(OpenedPlaneSuccess());
    }else{
      print('Could not launch $planeUrl');
      emit(OpenedPlaneError());
    }
  }

  static const instructionUrl = 'https://www.pnu.edu.sa/ar/Deanship/Registration/Pages/acadic.aspx';
  void openLaunchURLInstruction()  {
    emit(OpenPlaneLoadingState());

    if(  canLaunch(instructionUrl) != null){
      launch(instructionUrl);
      emit(OpenedPlaneSuccess());
    }else{
      print('Could not launch $instructionUrl');
      emit(OpenedPlaneError());
    }
  }

  static const deleteAndAddUrl = 'https://www.pnu.edu.sa/ar/Deanship/Registration/Continuous/Pages/Delete-add.aspx';
  void openLaunchDeleteAndAdd()  {
    emit(OpenPlaneLoadingState());

    if(  canLaunch(deleteAndAddUrl) != null){
      launch(deleteAndAddUrl);
      emit(OpenedPlaneSuccess());
    }else{
      print('Could not launch $deleteAndAddUrl');
      emit(OpenedPlaneError());
    }
  }

  static const bannerUrl = 'https://srs.gcet.edu.om';
  void openLaunchBanner()  {
    emit(OpenPlaneLoadingState());

    if(  canLaunch(bannerUrl) != null){
      launch(bannerUrl);
      emit(OpenedPlaneSuccess());
    }else{
      print('Could not launch $bannerUrl');
      emit(OpenedPlaneError());
    }
  }

  void openWhatsAppURL()  {
    const url = 'tel:=+96894087065';
    emit(OpenWhatsAppLoadingState());

    if(  canLaunch(url) != null){
      launch(url);
      emit(OpenedWhatsAppSuccess());
    }else{
      print('Could not launch $url');
      emit(OpenedWhatsAppError());
    }
  }

  void createPost({
    required String text,
    required String drName,
    required String dateTime,
  }){
    emit(CreatePostLoadingState());
    PostModel model = PostModel(
      drName:drName,
      text: text,
      uId: userModel?.uId,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(uId)
        .collection('event')
        .add(model.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    })
        .catchError((error){

      emit(CreatePostErrorState());
    });
  }


  List<PostModel> posts =[];

  void getPosts() {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(uId)
        .collection('event')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      posts =[];
      event.docs.forEach((element) {
        posts.add(PostModel.fromJson(element.data()));
      });
    });
  }


  List<UserModel> users =[];

  void getAllUsers(){
    if(users.length ==0) {
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if(element.data()['uId'] != userModel?.uId) {
            users.add(UserModel.fromJson(element.data()));
          }
        });
        emit(GetAllUsersSuccessState());
      })
          .catchError((error){
        emit(GetAllUsersErrorState(error.toString()));
      });
    }
  }

  void sendMessage({
    required String? receiverId,
    required String dataTime,
    required String text,
  }){
    ChatModel model = ChatModel(
        receiverId: receiverId,
        senderId: userModel?.uId,
        dateTime: dataTime,
        text: text
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    })
        .catchError((error){
      emit(SendMessageErrorState());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel?.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    })
        .catchError((error){
      emit(SendMessageErrorState());
    });

  }

  List<ChatModel > messages=[];

  void getMessages({
    required String? receiverId,
  }){
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel?.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages=[];
      event.docs.forEach((element) {
        messages.add(ChatModel.fromJson(element.data()));
      });
    });
  }





}