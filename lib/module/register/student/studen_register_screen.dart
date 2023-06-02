
import 'package:askpn/layout/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/home_layout_screen.dart';
import '../../../shared/component/component.dart';
import '../../../shared/component/contasnt.dart';
import '../../../shared/network/local/cach_helper.dart';
import '../../sign_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class StudentRegisterScreen extends StatelessWidget {
  FocusNode myFocusNode =  FocusNode();
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var yearController = TextEditingController();
  var statusController = TextEditingController();
  var academicController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (BuildContext context)=> AskStudentRegisterCubit(),
      child: BlocConsumer<AskStudentRegisterCubit, AskStudentRegisterStates>(
        listener: (context, state){
          if(state is AskStudentCreateUserSuccessState){
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId)
                .then((value) {
              uId= state.uId;
              navigateAndFinish(context, HomeLayoutScreen());
              AskPunCubit.get(context).getUserModel();
            });

          }
        },
        builder: (context, state){
          return Scaffold(
            backgroundColor:Colors.white,
            appBar: AppBar(
              leading:IconButton(onPressed: (){
                Navigator.pop(context, SignInScreen());
              },
                icon: const Icon(Icons.arrow_back_ios,
                  color: Color(0xff004080),
                ),
              ),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          child:
                          const     Image(
                            image: AssetImage('assets/images/icon.png',),),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Enter your information',
                        style: TextStyle(
                            fontWeight:FontWeight.bold,
                            fontSize: 30
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        cursorColor:const Color(0xfffbd7d7),
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        // ignore: missing_return
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'Enter your name',
                          prefixIcon:const Icon(Icons.drive_file_rename_outline,
                          ),
                        ),
                      ),
                      const  SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        cursorColor:const Color(0xfffbd7d7),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        // ignore: missing_return
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter the email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'Enter the university email',
                          prefixIcon:const Icon(Icons.email_outlined,
                          ),
                        ),
                      ),
                      const    SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        cursorColor:const Color(0xfffbd7d7),
                        controller: yearController,
                        keyboardType: TextInputType.name,
                        // ignore: missing_return
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter the academic year';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'Academic year',
                          prefixIcon:const Icon(Icons.perm_contact_calendar_rounded,
                          ),
                        ),
                      ),
                      const  SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        cursorColor:const Color(0xfffbd7d7),
                        controller: statusController,
                        keyboardType: TextInputType.name,
                        // ignore: missing_return
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter your academic status';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'Study case',
                          prefixIcon:const Icon(Icons.announcement_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        cursorColor:const Color(0xfffbd7d7),
                        controller: academicController,
                        keyboardType: TextInputType.emailAddress,
                        // ignore: missing_return
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter the name of the academic supervisor';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'Academic supervisor',
                          prefixIcon:const Icon(Icons.admin_panel_settings_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        cursorColor:const Color(0xfffbd7d7),
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        // ignore: missing_return
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the password';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          if (_formKey.currentState!.validate()) {}
                        },
                        obscureText: AskStudentRegisterCubit.get(context).isPassword,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.symmetric(vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:const BorderSide(width: 0.8),
                          ),
                          labelText: 'password',

                          prefixIcon:const Icon(Icons.lock_outline,
                            // color: Color(0xff009E8F),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              AskStudentRegisterCubit.get(context).changePasswordStudentRegisterVisibility();
                            },
                            icon: Icon(AskStudentRegisterCubit.get(context).suffix,
                            ),
                          ),
                        ),
                      ),
                      const       SizedBox(
                        height: 25,
                      ),
                      ConditionalBuilder(
                        condition: state is! AskStudentRegisterLoadingState,
                        builder: (context) =>
                            Container(
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: defaultButton(
                                function: ()  async {
                                  if(_formKey.currentState!.validate() ){
                                    AskStudentRegisterCubit.get(context).userStudentRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      academic: academicController.text,
                                      status: statusController.text,
                                      year: yearController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'Sign in',
                                isUppercase: true,
                                backgroundColor:const Color(0xff004080),
                              ),
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
