import 'package:flutter/material.dart';

void navigateAndGo(context,Widget page){
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => page));
}

Widget defaultTextFormField({
 @required emailcontroller,
  IconData? prefixIcon,
  String? label,
  TextInputType? keyboardtype,
  suffixfunction,
  IconData? suffixIcon,
  onTap,
  bool isPassword = false ,
  validator,
})
=>TextFormField(
  validator: validator,
  obscureText: isPassword ,
  onTap: onTap,
controller: emailcontroller,
keyboardType: keyboardtype,
decoration: InputDecoration(
  border: OutlineInputBorder(),
prefixIcon: Icon(prefixIcon),
labelText: label,
  suffixIcon: IconButton(
    onPressed: suffixfunction,
    icon: Icon(suffixIcon),

  ),
),
);