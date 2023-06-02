import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Widget defaultTextField({
//   @required TextEditingController controller,
//   @required TextInputType type,
//   @required Function onSubmit,
//   @required Function onChange,
//   bool isPassword = false,
//   @required Function onTap,
//   @required Function validate,
//   @required String label,
//   @required IconData prefix,
//   @required IconData suffix,
//   @required Function suffixPressd,
//   bool isEnable = true,
// }) =>
//     TextFormField(
//       controller: controller,
//       keyboardType: type,
//       onFieldSubmitted: (s) {
//         onSubmit();
//       },
//       obscureText: isPassword,
//       onChanged: (s) {
//         onChange(s);
//       },
//
//       validator: (value) {
//       },
//       enabled: isEnable,
//       onTap: () {},
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(vertical: 12),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(width: 0.8),
//         ),
//         labelText: label,
//         prefixIcon: Icon(prefix),
//         suffixIcon: suffix != null
//             ? IconButton(
//             onPressed: () {
//               suffixPressd();
//             },
//             icon: Icon(suffix))
//             : null,
//       ),
//     );
class DefaultFormField extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType? type;
  void Function(String)? onSubmit;
  void Function(String)? onChange;
  void Function()? onTap;
  bool isPassword = false;
  String Function(String?)? validate;
  IconData? prefix;
  IconData? suffix;
  void Function()? suffixPressed;
  bool isClickable = true;
  bool isSuffix = false;

  DefaultFormField({
    required this.controller,
    this.isClickable = true,
    this.isPassword = false,
    this.isSuffix = false,
    required this.label,
    this.onChange,
    this.onSubmit,
    this.onTap,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.type,
    required this.validate,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: const TextStyle(color: Color(0xff004080), fontSize: 16),
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            filled: true,
            fillColor: Colors.white10,
            hintText: 'New Task',
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:const EdgeInsets.only(top: 10, bottom: 10, left: 20),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white10, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              prefix,
              color: Colors.grey,
            ),
            suffixIcon: isSuffix
                ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
                : null));
  }
}


Widget defaultTextButton({
  required Function function, required String text,
}) =>
    TextButton(

      onPressed: () {
        function();
      },
      child: Text(text),
    );

Widget defaultButton({
  double width = double.infinity,
  Color backgroundColor =const Color(0xff004080),
  required Function function,
  double radius = 12,
  required String text,
  bool isUppercase = true,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget myDivider() => Container(
  width: double.infinity,
  height: 2,
  color: Colors.grey,
);

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { success, error, warning }

Color choseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}


