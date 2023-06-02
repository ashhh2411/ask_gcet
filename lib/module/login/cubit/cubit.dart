
import 'package:askpn/module/login/cubit/state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/component/contasnt.dart';

class AskLoginCubit extends Cubit<AskLoginStates>{
  AskLoginCubit() : super(AskLoginInitialState());
  static AskLoginCubit get(context) =>BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AskLoginLoadingState());
  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
  ).then((value) {
    print(value.user?.email);
    print(value.user?.uid);
    uId = value.user!.uid;
    emit(AskLoginSuccessState(value.user!.uid));
  }).catchError((error){
    emit(AskLoginErrorState(error.toString()));
  });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword =!isPassword;
    suffix =isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
