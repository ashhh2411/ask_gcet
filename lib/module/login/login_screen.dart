import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/home_layout_screen.dart';
import '../../shared/component/component.dart';
import '../../shared/component/contasnt.dart';
import '../../shared/network/local/cach_helper.dart';
import '../register/student/studen_register_screen.dart';
import '../sign_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatelessWidget {
  FocusNode myFocusNode =  FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return  BlocProvider(
      create: (BuildContext context)=> AskLoginCubit(),
      child: BlocConsumer<AskLoginCubit, AskLoginStates>(
        listener: (context, state){
          if(state is AskLoginErrorState){
            showToast(text: state.error, state: ToastStates.error);
          }
          if(state is AskLoginSuccessState){
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId)
                .then((value) {
                  uId= state.uId;
              navigateAndFinish(context, HomeLayoutScreen());
            });
          }
          },
        builder: (context, state){
          return  Scaffold(
            backgroundColor:Colors.white,
            appBar: AppBar(
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                    const   SizedBox(
                      height: 15,
                    ),
                    const  Text(
                      'Login',
                      style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 30
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor:const Color(0xfffbd7d7),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        // ignore: missing_return
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Email Address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'Enter Your Email Address',
                          prefixIcon:const Icon(Icons.email_outlined,
                          ),
                        ),
                      ),
                    ),
                    const  SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(

                        cursorColor:const Color(0xfffbd7d7),
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Password';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if(_formKey.currentState!.validate()){
                            AskLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        obscureText:AskLoginCubit.get(context).isPassword,

                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'Enter Your Password',

                          prefixIcon:const Icon(Icons.lock_outline,
                            // color: Color(0xff009E8F),
                          ),

                          suffixIcon: IconButton(
                            onPressed: (){
                              AskLoginCubit.get(context).changePasswordVisibility();
                            },
                            icon: Icon(AskLoginCubit.get(context).suffix),
                          ),
                        ),
                      ),
                    ),
                    const    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50,
                          left: 50
                      ),
                      child:  ConditionalBuilder(
                        condition: state is! AskLoginLoadingState,
                        builder: (context) =>
                            defaultButton(
                              function: ()  async {
                                if(_formKey.currentState!.validate() ){
                                  AskLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'Sign in',
                              isUppercase: true,
                            ),
                        fallback: (context) =>
                        const   Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    const  SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const  Text(
                          'Don\'t Have An Account ?',

                        ),
                        MaterialButton(onPressed: (){
                          navigateTo(context, StudentRegisterScreen());
                        },
                          child:const Text(
                            'Register Now',
                            style: TextStyle(
                                color: Colors.blue
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
