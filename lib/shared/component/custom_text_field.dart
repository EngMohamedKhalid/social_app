import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.controller, required this.hintText, required this.prefix, required this.validateText, this.inputType}) : super(key: key);
final TextEditingController controller;
final String hintText;
final String validateText;
final IconData prefix;
final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
        validator: (value) {
          if(value!.isEmpty){
            return "$validateText must not be empty";
          }
          return null;
        },
      controller: controller,
      decoration: InputDecoration(
          hintText:hintText,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black
              )
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black
              )
          ),
          prefixIcon: Icon(
            prefix,
            size: 26.sp,
            color: Colors.black,
          )
      ),
    );
  }
}
