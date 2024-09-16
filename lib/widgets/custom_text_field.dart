import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.hintText,
      this.icon,
      this.onchanged,
      this.obscureText = false,
      this.inputType});
  String? hintText;
  TextInputType? inputType;
  Icon? icon;
  bool obscureText = false;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText,
      cursorColor: Colors.grey,
      style: const TextStyle(
        color: Colors.black,
      ),
      onChanged: onchanged,
      decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: Colors.white54,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey[400], //fontFamily: ' Playwrite Cuba'
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          )),
    );
  }
}
