import 'package:askpn/module/register/student/cubit/state.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/user_model.dart';

class AskStudentRegisterCubit extends Cubit<AskStudentRegisterStates>{
  AskStudentRegisterCubit() : super(AskStudentRegisterInitialState());
  static AskStudentRegisterCubit get(context) =>BlocProvider.of(context);
  void userStudentRegister({
    required String email,
    required String name,
    required String year,
    required String status,
    required String academic,
    required String password,
  }) {
    emit(AskStudentRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(email: email,
          uId: value.user!.uid,
          name: name,
          year: year,
          status: status,
          academic: academic,

      );

    }).catchError((error){
      print(error.toString());
      emit(AskStudentRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String year,
    required String status,
    required String academic,
    required String uId,
}){
    UserModel model = UserModel(
      name: name,
      email: email,
      year: year,
      status: status,
      academic: academic,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap()).then((value) {
          emit(AskStudentCreateUserSuccessState(model.uId));
    }).catchError((error){
      emit(AskStudentCreateUserErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordStudentRegisterVisibility(){
    isPassword =!isPassword;
    suffix =isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(ChangePasswordStudentRegisterVisibilityState());
  }
}
