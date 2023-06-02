
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../layout/home_layout_screen.dart';
import '../../../shared/component/component.dart';
import '../../sign_screen.dart';

class EmpolyeeRegisterScreen extends StatelessWidget {
  FocusNode myFocusNode =  FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var collegeController = TextEditingController();
    var sectionController = TextEditingController();

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context, SignInScreen());
        },
          icon:const Icon(Icons.arrow_back_ios,
            color: Color(0xff004080),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
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
              const  SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  cursorColor:const Color(0xfffbd7d7),
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  // ignore: missing_return
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:const BorderSide(width: 0.8),
                    ),
                    labelText: 'Enter your Name',
                    prefixIcon:const Icon(Icons.drive_file_rename_outline,
                    ),
                  ),
                ),
              ),
              const    SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  cursorColor:const Color(0xfffbd7d7),
                  controller: collegeController,
                  keyboardType: TextInputType.name,
                  // ignore: missing_return
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter the college name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:const BorderSide(width: 0.8),
                    ),
                    labelText: 'College name',
                    prefixIcon:const Icon(Icons.school_outlined,
                    ),
                  ),
                ),
              ),
              const   SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textDirection: TextDirection.rtl,
                  cursorColor:const Color(0xfffbd7d7),
                  controller: sectionController,
                  keyboardType: TextInputType.name,
                  // ignore: missing_return
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Enter the division name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:const BorderSide(width: 0.8),
                    ),
                    labelText: 'div',
                    prefixIcon:const Icon(Icons.class_outlined,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
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
                      return 'Enter the password';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState!.validate()) {}
                  },
                  obscureText: true,
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
                      onPressed: () {},
                      icon:const Icon(Icons.remove_red_eye,
                      ),
                    ),
                  ),
                ),
              ),
              const   SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50,
                    left: 50
                ),
                child: ConditionalBuilder(
                  condition: true,
                  builder: (context) =>
                      defaultButton(
                        function: ()  async {
                          if(_formKey.currentState!.validate() ){
                            navigateAndFinish(context, HomeLayoutScreen());
                          }
                        },
                        text: 'Sign in',
                        isUppercase: true,
                        backgroundColor:const Color(0xff004080),
                      ),
                  fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
