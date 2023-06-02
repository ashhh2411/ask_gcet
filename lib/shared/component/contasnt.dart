
import 'package:askpn/module/login/login_screen.dart';
import 'package:flutter/material.dart';
import '../network/local/cach_helper.dart';
import 'component.dart';

void signOut(BuildContext context){
  CacheHelper.removeData(key: 'uId').then((value) {
    navigateAndFinish(context, LoginScreen());
  });
}

String? uId = '';

